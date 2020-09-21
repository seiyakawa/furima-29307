FactoryBot.define do
  factory :order_address do
    token { 'tok_bd071ca5e86f52e9da294b7bbeb9' }
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '調布市1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
