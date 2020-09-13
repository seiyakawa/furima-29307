class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6, }+\z/i, message: 'Password Include both letters and numbers' }

  with_options presence: true do
    validates :family_name_kanzi, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: "First name Full-width characters"}
    validates :first_name_kanzi,  format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: "Last name Full-width characters"}
    validates :family_name_kana,  format: { with: /\A[ァ-ヶー-]+\z/, message: "First name kana Full-width katakana characters"}
    validates :first_name_kana,   format: { with: /\A[ァ-ヶー-]+\z/, message: "Last name kana Full-width katakana characters"}
  end
end