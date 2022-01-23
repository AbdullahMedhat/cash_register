# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'
RSpec.describe 'orders', type: :request do
  describe 'GET /checkout' do
    let!(:order) { create(:order) }
    let!(:green_tea) do
      create(
        :product,
        name: 'Green Tea', product_code: 'GR1', price: 3.11
      )
    end

    let!(:strawberries) do
      create(
        :product,
        name: 'Strawberries', product_code: 'SR1', price: 5.00
      )
    end

    let!(:coffe) do
      create(
        :product,
        name: 'Coffe', product_code: 'CF1', price: 11.23
      )
    end

    let!(:buy_one_get_one_offer) do
      create(
        :offer,
        description: 'Buy one get one',
        minimum_quantity: 1,
        offer_type: 'BOGO'
      )
    end

    let!(:discount_10_offer) do
      create(
        :offer,
        description: 'Buy 3 or more and get 5% discount',
        minimum_quantity: 3,
        discount_percentage: 10,
        offer_type: 'DISCOUNT'
      )
    end

    let!(:discount_33_3_offer) do
      create(
        :offer,
        description: 'Buy 3 or more and get 33% discount',
        minimum_quantity: 3,
        discount_percentage: 33.3,
        offer_type: 'DISCOUNT'
      )
    end

    before(:each) do
      create(
        :product_offer,
        product: green_tea,
        offer: buy_one_get_one_offer
      )

      create(
        :product_offer,
        product: strawberries,
        offer: discount_10_offer
      )

      create(
        :product_offer,
        product: coffe,
        offer: discount_33_3_offer
      )
    end

    context 'For order with items GR1,SR1,GR1,GR1,CF1' do
      before(:each) do
        create(
          :order_product,
          order: order, product: green_tea, quantity: 3
        )

        create(
          :order_product,
          order: order, product: strawberries, quantity: 1
        )

        create(
          :order_product,
          order: order, product: coffe, quantity: 1
        )
      end

      it 'should show the details for each product in the basket with the total price' do
        get '/checkout'
        expect(response).to have_http_status(:ok)
        expect(response).to render_template :checkout
      end

      it 'should shoud the correct prices for each product, and the total price for this order' do
        order_details = [
          {
            name: 'Green Tea',
            quantity: 3,
            price: 6.22
          },
          {
            name: 'Strawberries',
            quantity: 1,
            price: 5.00
          },
          {
            name: 'Coffe',
            quantity: 1,
            price: 11.23
          }
        ]

        expect(assigns(:total_price)).to eq(22.45)
        expect(assigns(:order_details)).to eq(order_details)
      end
    end

    context 'For order with items GR1,GR1' do
      before(:each) do
        create(
          :order_product,
          order: order, product: green_tea, quantity: 2
        )
      end

      it 'should show the details for each product in the basket with the total price' do
        get '/checkout'
        expect(response).to have_http_status(:ok)
        expect(response).to render_template :checkout
      end

      it 'should shoud the correct prices for each product, and the total price for this order' do
        order_details = [
          {
            name: 'Green Tea',
            quantity: 2,
            price: 3.11
          }
        ]

        expect(assigns(:total_price)).to eq(3.11)
        expect(assigns(:order_details)).to eq(order_details)
      end
    end

    context 'For order with items SR1,SR1,GR1,SR1' do
      before(:each) do
        create(
          :order_product,
          order: order, product: green_tea, quantity: 1
        )

        create(
          :order_product,
          order: order, product: strawberries, quantity: 3
        )
      end

      it 'should show the details for each product in the basket with the total price' do
        get '/checkout'
        expect(response).to have_http_status(:ok)
        expect(response).to render_template :checkout
      end

      it 'should shoud the correct prices for each product, and the total price for this order' do
        order_details = [
          {
            name: 'Green Tea',
            quantity: 1,
            price: 3.11
          },
          {
            name: 'Strawberries',
            quantity: 1,
            price: 13.50
          }
        ]

        expect(assigns(:total_price)).to eq(16.61)
        expect(assigns(:order_details)).to eq(order_details)
      end
    end

    context 'For order with items GR1,CF1,SR1,CF1,CF1' do
      before(:each) do
        create(
          :order_product,
          order: order, product: green_tea, quantity: 1
        )

        create(
          :order_product,
          order: order, product: strawberries, quantity: 1
        )

        create(
          :order_product,
          order: order, product: coffe, quantity: 3
        )
      end

      it 'should show the details for each product in the basket with the total price' do
        get '/checkout'
        expect(response).to have_http_status(:ok)
        expect(response).to render_template :checkout
      end

      it 'should shoud the correct prices for each product, and the total price for this order' do
        order_details = [
          {
            name: 'Green Tea',
            quantity: 1,
            price: 3.11
          },
          {
            name: 'Strawberries',
            quantity: 1,
            price: 5.00
          },
          {
            name: 'Coffe',
            quantity: 3,
            price: 22.46
          }
        ]

        expect(assigns(:total_price)).to eq(30.57)
        expect(assigns(:order_details)).to eq(order_details)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
