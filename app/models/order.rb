class Order < ApplicationRecord
  # アソシエーション1対多
  belongs_to :user
  # アソシエーション1対1 子モデル
  belongs_to :item
  # アソシエーション1対1 親モデル
  has_one :address
end
