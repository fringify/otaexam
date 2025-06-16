class CartItemPresenter

  attr_reader :cart_item
  def initialize(cart_item)
    @cart_item = cart_item
  end

  def call
    {
      id: cart_item.id,
      name: cart_item.product.name,
      price_in_cents: cart_item.price_in_cents,
      original_price_in_cents: cart_item.original_price_in_cents,
      quantity: cart_item.quantity
    }
  end
end