# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name         { Faker::Name.first_name }
    product_code { Faker::Lorem.paragraph }
    price        { Faker::Number.within(range: 1..10) }
  end
end
