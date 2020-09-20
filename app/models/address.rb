class Address < ApplicationRecord
  # アソシエーション1対1 子モデル
  belongs_to :order

  # ActiveHashを使用してアソシエーションを設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
