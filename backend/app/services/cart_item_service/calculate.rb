module CartItemService
  class Calculate
    attr_reader :cart_item

    delegate :product, :quantity, to: :cart_item

    def initialize(cart_item)
      @cart_item = cart_item
    end

    def call
      (quantity_for_calculation * calculated_price_basis).to_i
    end

    private

    def quantity_for_calculation
      # This method should return number of items that will be used for calculation
      # Item can be lessen if there is a BuyXGetY rule
      return quantity unless product.rules.buy_x_get_y.exists?
      rule = product.rules.buy_x_get_y.first
      
      rule.chargeable_items_count(quantity)
    end

    def calculated_price_basis
      # This method should return the new price
      # In event both AmountSpecific and DiscountedPrice exists, we will use whichever is lower
      return product.price_in_cents unless product.rules.amount_or_discount_based.exists?

      [amount_after_discount_rule, amount_after_specific_amount_rule].compact.min
    end

    def amount_after_discount_rule
      rule = product.rules.amount_specific.first
      return nil unless rule
      rule.apply(quantity)
    end

    def amount_after_specific_amount_rule
      rule = product.rules.discount_based.first
      return nil unless rule
      rule.apply(quantity)
    end




  end
end