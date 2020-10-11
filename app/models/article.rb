class Article < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :time_zone_id
  belongs_to_active_hash :prefecture_id
  belongs_to_active_hash :category_id

end
