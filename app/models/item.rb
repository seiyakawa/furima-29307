class Item < ApplicationRecord
  # ActiveHashを使用してアソシエーションを設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  #空の投稿を保存できないように設定
  validates :name, :text, :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery, price, presence: true

  #ジャンルの選択が「--」の時は保存できないように設定
  validates :category_id, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery, numericality: { other_than: 0 } 
end
