class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :article_hashes, dependent: :destroy
  has_many :hashtags, through: :article_hashes

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :time_zone
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category

  with_options presence: true do
    validates :title, length: { maximum: 30 }
    validates :date
    validates :time_zone_id, numericality: { other_than: 1, message: 'select' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'select' }
    validates :category_id, numericality: { other_than: 1, message: 'select' }
    validates :text
    validates :address
  end

  validates :hashbody, length: { maximum: 30 }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  after_create do
    article = Article.find_by(id: id)
    hashtags  = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
    article.hashtags << tag
    end
  end

  before_update do 
    article = Article.find_by(id:id)
    article.hashtags.clear
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      article.hashtags << tag
    end
  end
end
