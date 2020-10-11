class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image

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

end
