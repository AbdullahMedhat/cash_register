# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'should validate presence of product_code' do
    product = Product.new
    product.name = 'mobile phone'
    product.price = 22.23
    expect(product).to_not be_valid
  end

  it 'should validate presence of name' do
    product = Product.new
    product.product_code = 'MP1'
    product.price = 22.23
    expect(product).to_not be_valid
  end

  it 'should validate presence of price' do
    product = Product.new
    product.product_code = 'MP1'
    product.name = 'mobile phone'
    expect(product).to_not be_valid
  end
end
