module CartItemService
  class Calculate
    attr_reader :cart_item

    delegate :product, :quantity, to: :cart_item

    def initialize(cart_item)
      @cart_item = cart_item
    end

    def call
      quantity_for_calculation * calculated_price_basis
    end

    private

    def quantity_for_calculation
      # This method should return number of items that will be used for calculation
      # Item can be lessen if there is a BuyXGetY rule

    end

    def calculated_price_basis
      # This method should return the new price
      # In event both AmountSpecific and DiscountedPrice exists, we will use whichever is lower
    end

  end
end