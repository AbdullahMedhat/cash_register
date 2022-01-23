# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_products
  has_many :order, through: :order_products

  has_many :product_offers
  has_many :offers, through: :product_offers

  validates_presence_of :product_code, :name, :price
end
