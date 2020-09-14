class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }

  with_options presence: true do
    validates :family_name_kanzi, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: "Full-width characters"}
    validates :first_name_kanzi,  format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: "Full-width characters"}
    validates :family_name_kana,  format: { with: /\A[ァ-ヶー-]+\z/, message: "Full-width katakana characters"}
    validates :first_name_kana,   format: { with: /\A[ァ-ヶー-]+\z/, message: "Full-width katakana characters"}
  end
end