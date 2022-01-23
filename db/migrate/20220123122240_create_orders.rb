# frozen_string_literal: true

# This relation to hold the orders for the user, we gone add the users later
class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, &:timestamps
  end
end
