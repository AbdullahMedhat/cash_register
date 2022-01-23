# frozen_string_literal: true

class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string   :offer_type, null: false
      t.string   :description
      t.integer  :minimum_quantity, default: 1, null: false
      t.float    :discount_percentage

      t.timestamps
    end

    add_index :offers, %i[offer_type discount_percentage], unique: true
  end
end
