class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'include both letters and numbers' }

  with_options presence: true do
    validates :nickname
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'full-width characters' }
    validates :name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'full-width katakana characters' }
    validates :user_address, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'full-width characters' }
    validates :phone,numericality: { only_integer: true }, length: { maximum: 11 }
  end
end
