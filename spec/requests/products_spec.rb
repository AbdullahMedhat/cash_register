# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'products', type: :request do
  before(:each) do
    @products = FactoryBot.create_list(:product, 3)
  end

  describe 'GET /products' do
    it 'should returns all products' do
      get '/'
      expect(response).to have_http_status(:ok)
      expect(assigns(:products)).to eq(Product.last(3))
    end

    it 'should render the right template, with the right partials' do
      get '/'
      expect(response).to render_template :index
      expect(response).to render_template(partial: '_product')
    end
  end
end
