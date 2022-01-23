# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: :index
  post '/products/add_item_to_basket', to: 'products#add_item_to_basket'
  delete '/products/remove_basket_item', to: 'products#remove_basket_item'

  get '/orders/checkout', to: 'orders#checkout'
end
