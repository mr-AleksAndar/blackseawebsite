# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  def new
    @cart_items = session[:cart] || {}
    if @cart_items.empty?
      redirect_to products_path, alert: "Your cart is empty."
      return
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    # Build order items from session cart
    (session[:cart] || {}).each do |variant_id, qty|
      variant = Variant.find(variant_id)
      @order.order_items.build(
        variant:          variant,
        quantity:         qty.to_i,
        unit_price_cents: variant.price_cents
      )
    end

    if @order.save
      # Clear the cart
      session.delete(:cart)
      redirect_to products_path, notice: "Thank you for your order!"
    else
      @cart_items = session[:cart] || {}
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :name,
      :email,
      :phone,
      :address,
      :city,
      :postal_code
    )
  end
end