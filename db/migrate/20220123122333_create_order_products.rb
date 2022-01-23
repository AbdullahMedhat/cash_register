# frozen_string_literal: true

class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity, default: 1

      t.timestamps
    end

    add_index :order_products, %i[order_id product_id], unique: true
  end
end
