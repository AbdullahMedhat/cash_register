# frozen_string_literal: true

class OfferCalculator
  def initialize(offer, quantity, price)
    @offer = offer
    @quantity = quantity
    @price = price
  end

  def apply_offer_if_eligible
    if @quantity >= @offer.minimum_quantity
      case @offer.offer_type
      when 'BOGO'
        apply_buy_one_get_one_offer
      when 'DISCOUNT'
        apply_discount_offer
      end
    else
      @quantity * @price
    end
  end

  def apply_buy_one_get_one_offer
    (@quantity / 2.0).round * @price
  end

  def apply_discount_offer
    new_price = (@price - (@price * @offer.discount_percentage))
    @quantity * new_price
  end
end
