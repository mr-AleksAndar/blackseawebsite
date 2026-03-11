class CartsController < ApplicationController
  def show
    # session[:cart] is a hash: { "variant_id" => quantity, ... }
    @items = (session[:cart] || {}).map do |variant_id, qty|
      variant = Variant.find_by(id: variant_id)
      next unless variant
      { variant: variant, quantity: qty.to_i }
    end.compact
  end

  def destroy
    session.delete(:cart)
    redirect_to products_path, notice: "Your cart has been emptied."
  end
end