class Item < ApplicationRecord
  # アソシエーション 1対多
  belongs_to :user
  # アソシエーション1対1 親モデル
  has_one :order
  # itemsテーブルのレコードと画像を紐づけるためにhas_one_attachedというメソッドを利用
  has_one_attached :image
  # ActiveHashを使用してアソシエーションを設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  # 空の投稿を保存できないように設定
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    # validates :category
    # validates :sales_status
    # validates :shipping_fee_status
    # validates :prefecture
    # validates :scheduled_delivery
    # 価格の入力は半角数字のみ 範囲は300から9,999,999
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'を半角数字で入力してください' }
    validates_inclusion_of :price, in: 300..9_999_999, message: 'を300〜9,999,999の範囲で入力してください'
    # validates :price,  inclusion: {in: 300..9999999, message: "Out of setting range" }
  end

  # ジャンルの選択が「--」の時は保存できないように設定
  with_options numericality: { other_than: 0, message: 'を選択してください' } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
end
