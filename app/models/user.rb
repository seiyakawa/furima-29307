class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション１対多
  has_many :items
  has_many :orders

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'を半角英数字混合で入力してください' }

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :family_name_kanzi, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: 'を全角で入力してください'}
    validates :first_name_kanzi,  format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: 'を全角で入力してください'}
    validates :family_name_kana,  format: { with: /\A[ァ-ヶー-]+\z/, message: 'を全角カタカナで入力してください'}
    validates :first_name_kana,   format: { with: /\A[ァ-ヶー-]+\z/, message: 'を全角カタカナで入力してください'}
  end
end
