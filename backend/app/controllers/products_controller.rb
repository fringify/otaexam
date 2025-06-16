class ProductsController < ApplicationController

  def index
    products = Product.all
    render json: products
  end

  private
end
