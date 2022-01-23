# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: :checkout
  before_action :validate_order, only: :checkout

  def checkout
    @total_price = 0.0
    @order_details = []
    calculate_order_products_prices
    @order_details.each { |order| @total_price += order[:price] }
  end

  private

  def validate_order
    return if @order.order_products.present?

    redirect_to root_path
  end

  def set_order
    @order = Order.includes(order_products: { product: { product_offers: :offer } }).first_or_create
  end

  def calculate_order_products_prices
    @order.order_products.each do |order_product|
      if order_product.product.offers.present?
        offer_calculator = OfferCalculator.new(
          order_product.product.offers.first,
          order_product.quantity, order_product.product.price
        )

        @order_details.push({
                              name: order_product.product.name,
                              quantity: order_product.quantity,
                              price: offer_calculator.apply_offer_if_eligible
                            })
      else
        @order_details.push({
                              name: order_product.product.name,
                              quantity: order_product.quantity,
                              price: (order_product.quantity * order_product.product.price)
                            })
      end
    end
  end
end
