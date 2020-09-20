class OrderAddress

  include ActiveModel::Model
  # 指定した値をインスタンス変数として取り扱ってくれるメソッド
  attr_accessor :token, :post_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

    # 空の投稿を保存できないように設定
    with_options presence: true do
      validates :token # クレジットカードトークンバリデーション
      validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'} # 郵便番号は7桁ハイフン有
      validates :city
      validates :address
      validates :phone_number, numericality: { with: /\A\d{11}\z/} # 電話番号は11桁ハイフン無
    end
    
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

    def save
      # 購入の情報を保存
      order = Order.create(user_id: user_id, item_id: item_id)
      # 住所の情報を保存
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
    end

end