# frozen_string_literal: true

class CreateProductOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :product_offers do |t|
      t.integer :product_id
      t.integer :offer_id
      t.timestamps
    end

    add_index :product_offers, %i[product_id offer_id], unique: true
  end
end
