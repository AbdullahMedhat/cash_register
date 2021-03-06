# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products
end
