class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :encrypted_password, presence: true,
                   format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
         validates :family_name, presence: true,
                   format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
         validates :first_name, presence: true, 
                   format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
         validates :family_name_kana, presence: true,
                   format: { with: /\A[ァ-ヴー]+\z/u }
         validates :first_name_kana, presence: true,
                   format: { with: /\A[ァ-ヴー]+\z/u }
         validates :birthday, presence: true
end
