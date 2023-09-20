FactoryBot.define  do
  factory :item do
  item_name        {Faker::Name.initials(number: 3)}
  category_id      {"2"}
  note             {Faker::Lorem.characters(number: 5).upcase }
  condition_id     {"2"}
  delivery_fee_id  {"2"}
  prefecture_id    {"2"}
  shipping_day_id  {"2"}
  price            {"300"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
