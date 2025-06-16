class CartItemsController < ApplicationController
  before_action :load_cart

  def create
    CartItemService::Add.new(product_id).call
    @cart.reload
    
    render json: CartPresenter.new(@cart).call
  end

  private

  def product_id
    params.fetch(:cart_item).permit(:product_id)[:product_id]
  end

  def load_cart
    @cart ||= User.default.load_cart
  end
end
