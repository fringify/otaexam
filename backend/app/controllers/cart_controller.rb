class CartController < ApplicationController

  before_action :load_cart
  
  def index
    render json: CartPresenter.new(@cart).call
  end

  def clear
    @cart.cart_items.destroy_all
    render json: CartPresenter.new(@cart).call
  end

  private

  def load_cart
    @cart ||= User.default.load_cart
  end
end
