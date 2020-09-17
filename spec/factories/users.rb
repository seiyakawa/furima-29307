FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'abc123'}
    password_confirmation {password}
    family_name_kanzi {'山田'}
    first_name_kanzi {'太郎'}
    family_name_kana {'ヤマダ'}
    first_name_kana {'タロウ'}
    birthday {'2000/1/1'}
  end
end
