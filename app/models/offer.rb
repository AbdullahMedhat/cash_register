# frozen_string_literal: true

class Offer < ApplicationRecord
  has_many :product_offers
  has_many :products, through: :product_offers

  validates_presence_of :minimum_quantity
end
