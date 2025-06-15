module CartItemService
  class Calculate
    attr_reader :cart_item

    def initialize(cart_item)
      @cart_item = cart_item
    end

    def call
    end

    private
  end
end