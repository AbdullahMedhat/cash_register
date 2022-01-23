# frozen_string_literal: true

green_tea = Product.create(
  name: 'Green Tea', product_code: 'GR1', price: 3.11
)

strawberries = Product.create(
  name: 'Strawberries', product_code: 'SR1', price: 5.00
)

coffe = Product.create(
  name: 'Coffe', product_code: 'CF1', price: 11.23
)

order = Order.first_or_create

OrderProduct.create([
                      {
                        order_id: order.id, product_id: green_tea.id, quantity: 3
                      },
                      {
                        order_id: order.id, product_id: strawberries.id, quantity: 1
                      },
                      {
                        order_id: order.id, product_id: coffe.id, quantity: 1
                      }
                    ])

buy_one_get_one_offer = Offer.create(
  description: 'Buy one get one',
  minimum_quantity: 1,
  offer_type: 'BOGO'
)

discount_10_offer = Offer.create(
  description: 'Buy 3 or more and get 10% discount',
  minimum_quantity: 3,
  discount_percentage: 0.10,
  offer_type: 'DISCOUNT'
)

discount_33_3_offer = Offer.create(
  description: 'Buy 3 or more and get 33% discount',
  minimum_quantity: 3,
  discount_percentage: (1.0 / 3.0),
  offer_type: 'DISCOUNT'
)

ProductOffer.create([
                      {
                        product_id: green_tea.id,
                        offer_id: buy_one_get_one_offer.id
                      },
                      {
                        product_id: strawberries.id,
                        offer_id: discount_10_offer.id
                      },
                      {
                        product_id: coffe.id,
                        offer_id: discount_33_3_offer.id
                      }
                    ])
