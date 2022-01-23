# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_order, only: :index

  def index
    @products = Product.all
  end

  private

  def set_order
    @order = Order.first_or_create
  end
end
