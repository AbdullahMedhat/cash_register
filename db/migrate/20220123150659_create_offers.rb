# frozen_string_literal: true

class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string   :description
      t.integer  :minimum_quantity, default: 1, null: false
      t.integer  :discount_percentage

      t.timestamps
    end
  end
end
