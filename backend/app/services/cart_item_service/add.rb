module CartItemService
  class Add

    attr_reader :product_id

    def initialize(product_id)
      @product_id = product_id
    end

    def call
      if cart_item.new_record?
        cart_item.quantity = 1
      else
        cart_item.quantity += 1
      end
      
      cart_item.save!
      Calculate.new(cart_item).call
    end

    private

    def cart_item
      @cart_item ||= @cart.cart_items.find_or_initialize_by(product_id: product_id)
    end

    def cart
      @cart ||= User.default.load_cart
    end
  end
end