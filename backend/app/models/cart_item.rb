class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def original_price_in_cents
    quantity * product.price_in_cents
  end

end
