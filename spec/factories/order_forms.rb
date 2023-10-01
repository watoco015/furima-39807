FactoryBot.define do
  factory :order_form do
    post_code      { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id  { '5' }
    city           { Faker::Address.city }
    block          { Faker::Address.street_address }
    building       { Faker::Address.street_address }
    phone_number   { Faker::Number.decimal_part(digits: 11) }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
