# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    description         { Faker::Lorem.paragraph }
    minimum_quantity    { Faker::Number.within(range: 1..10) }
    discount_percentage { Faker::Number.within(range: 1..100) }
  end
end
