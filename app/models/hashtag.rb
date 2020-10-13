class Hashtag < ApplicationRecord
  has_many :article_hashes
  has_many :articles, through: :article_hashes

  validates :hashname, presence: true, length: { maximum: 30 }
end
