class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数字を含めてください' }
  validates :nickname, presence: true, uniqueness: { case_sensitive: false }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }

  has_many :articles
  has_many :favorites
  has_many :fav_articles, through: :favorites, source: :article
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


end
