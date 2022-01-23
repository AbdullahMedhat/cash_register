# frozen_string_literal: true

green_tea = Product.create(
  name: 'Green Tea', product_code: 'GR1', price: 3.11
)

strawberries = Product.create(
  name: 'Strawberries', product_code: 'SR1', price: 3.00
)

coffe = Product.create(
  name: 'Coffe', product_code: 'CF1', price: 11.23
)

order = Order.create

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
