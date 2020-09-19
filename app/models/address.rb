class Address < ApplicationRecord
  # アソシエーション1対1 子モデル
  belongs_to :order

  # 空の投稿を保存できないように設定
  with_options presence: true do
    # 郵便番号は7桁ハイフン有
    validates :post_code format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates :city
    validates :address
    # 電話番号は11桁ハイフン無
    validates :phone_number, numericality: { with: /\A\d{11}\z/}
  end

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :prefecture_id
  end

end
