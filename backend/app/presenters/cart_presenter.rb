class CartPresenter

  attr_reader :cart
  def initialize(cart)
    @cart = cart
  end

  def call
    {
      items: items,
      total_price_in_cents: cart.cart_items.sum(:price_in_cents)
    }
  end

  private

  def items

    cart.cart_items.map do |x|
      CartItemPresenter.new(x).call
    end
  end

end