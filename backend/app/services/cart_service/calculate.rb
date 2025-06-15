module CartService
  class Calculate
    attr_reader :cart

    def initialize(cart)
      @cart = cart
    end

    def call
      cart.cart_items.each do |cart_item|
        CartItemService::Calculate.new(cart_item).call
      end

      cart.reload
      cart.cart_items.sum(:price_in_cents) / 100.0
    end
  end
end