FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {"d8" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name            {"田中"}
    first_name             {"たろう"}
    family_name_kana       {"タナカ"}
    first_name_kana        {"タロウ"}
    birthday               {"2023.09.18"}
  end
end