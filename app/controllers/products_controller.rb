# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index
    @tags = Tag.order(:name)
    if params[:tag].present?
      @products = Tag.find_by(name: params[:tag])&.products || Product.none
    else
      @products = Product.all
    end
    @products = @products.includes(:variants)
  end

  def show
    # Use FriendlyId to look up by slug instead of numeric ID
    @product  = Product.friendly.find(params[:id])
    @variants = @product.variants
  end
end