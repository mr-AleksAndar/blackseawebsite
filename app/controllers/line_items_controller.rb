class LineItemsController < ApplicationController
  # POST /line_items
  def create
    # initialize the cart hash in session
    session[:cart] ||= {}

    # grab the incoming values
    variant_id = params[:variant_id].to_s
    quantity   = params[:quantity].to_i

    # increment existing or add new
    if session[:cart][variant_id]
      session[:cart][variant_id] = session[:cart][variant_id].to_i + quantity
    else
      session[:cart][variant_id] = quantity
    end

    redirect_to cart_path, notice: "#{quantity} item(s) added to your cart."
  end

  # PATCH /line_items/:id
  # (optional: update quantity)
  def update
    session[:cart] ||= {}
    variant_id = params[:variant_id].to_s
    quantity   = params[:quantity].to_i

    if quantity > 0
      session[:cart][variant_id] = quantity
      notice = "Cart updated."
    else
      session[:cart].delete(variant_id)
      notice = "Item removed from cart."
    end

    redirect_to cart_path, notice: notice
  end

  # DELETE /line_items/:id
  # (optional: remove item)
  def destroy
    session[:cart]&.delete(params[:variant_id].to_s)
    redirect_to cart_path, notice: "Item removed from cart."
  end
end