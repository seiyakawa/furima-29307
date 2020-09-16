FactoryBot.define do
  factory :item do
    association :user

    # active_hash :category
    # active_hash :sales_status
    # active_hash :shipping_fee_status
    # active_hash :prefecture
    # active_hash :scheduled_delivery

    name { Faker::Name.name }
    text { Faker::Lorem.sentence }
    category_id { 1 }
    sales_status_id { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id { 1 }
    scheduled_delivery_id { 1 }
    price { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
