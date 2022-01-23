# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_code, unique: true
      t.string :name, unique: true
      t.float :price

      t.timestamps
    end
  end
end
