# app/mailers/order_mailer.rb
class OrderMailer < ApplicationMailer
    default to: 'bl8alex@gmail.com'
  
    def fast_order_email
      @product = params[:product]
      @variant = params[:variant]
      @customer = params[:customer]
  
      mail(
        subject: 'New Fast Order Received',
        from: 'orders@blacksea.surf',
        reply_to: @customer[:email]
      )
    end
  end