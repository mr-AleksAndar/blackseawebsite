# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index
    @products = Product.includes(:variants)
  end

  def show
    @product = Product.find(params[:id])
    @variants = @product.variants
  end
end