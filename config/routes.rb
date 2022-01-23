# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'products#index'

  resources :products, only: :index
end
