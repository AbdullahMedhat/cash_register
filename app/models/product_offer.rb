# frozen_string_literal: true

class ProductOffer < ApplicationRecord
  belongs_to :product
  belongs_to :offer
end
