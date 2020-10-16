class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :article_hashes, dependent: :destroy
  has_many :hashtags, through: :article_hashes
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :time_zone
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category

  with_options presence: true do
    validates :title, length: { maximum: 30 }
    validates :date
    validates :time_zone_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :address
    validates :images
  end

  validates :hashbody, length: { maximum: 30 }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  after_create do
    article = Article.find_by(id: id)
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      article.hashtags << tag
    end
  end

  before_update do
    article = Article.find_by(id: id)
    article.hashtags.clear
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      article.hashtags << tag
    end
  end

  def self.search(search)
    if search != ""
      Article.where('title LIKE(?) OR text LIKE(?) OR hashbody LIKE(?)', "%#{search}%","%#{search}%","%#{search}%")
    else
      Article.all
    end
  end

  validate :validate_images

  private

  def validate_images
    return if images.count <= 3

    errors.add(:images, 'は最大3枚までアップロード可能です')
  end
end
