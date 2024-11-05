# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @variant = Variant.find(params[:variant_id])
  end

  def create
    order_params = params.require(:order).permit(:name, :email, :phone)
    @product = Product.find(params[:product_id])
    @variant = Variant.find(params[:variant_id])

    # Send order email
    OrderMailer.with(
      product: @product,
      variant: @variant,
      customer: order_params
    ).fast_order_email.deliver_now

    redirect_to products_path, notice: 'Your order has been received!'
  rescue ActiveRecord::RecordNotFound => e
    redirect_to products_path, alert: 'Product or variant not found.'
  end
end