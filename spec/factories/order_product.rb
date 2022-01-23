# frozen_string_literal: true

FactoryBot.define do
  factory :order_product do
    quantity { Faker::Number.within(range: 1..10) }
    order
    product
  end
end
