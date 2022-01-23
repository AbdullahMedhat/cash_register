# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_order, only: %i[index remove_basket_item]
  before_action :set_order_product, only: :add_item_to_basket

  def index
    @products = Product.all
  end

  def add_item_to_basket
    if @product_item
      @product_item.quantity += params[:quantity].to_i
      @product_item.save!
    else
      OrderProduct.create(order_product_params)
    end

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def remove_basket_item
    OrderProduct.where(order_id: @order.id).destroy_all

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private

  def set_order
    @order = Order.first_or_create
  end

  def set_order_product
    @product_item = OrderProduct.find_by(
      order_id: params[:order_id], product_id: params[:product_id]
    )
  end

  def order_product_params
    params.permit(:order_id, :product_id, :quantity)
  end
end
