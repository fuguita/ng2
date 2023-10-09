class Public::OrdersController < ApplicationController

  def new
    @order = Order.new

  end

  def check
        @order = Oreder.new(order_params)
      if params[:order][:payment_method] == nill
         render :new
         return
      end
      if params[:order][:address_number] == "0"
         @order.customer_address_display = current_customer.customer_address_display
         @order.name = current_customer.full_name
         @order.customer_id = current_customer.id
      elsif params[:order][:address_number] == "1"
         @shipping = Shipping.find(params:[:order][:shipping_id])
         @order.shipping_display = @shipping.shipping_display
      elsif params[:order][:address_number] == "2"
        if order_params[:postal_code] == "" || order_params[:name] == "" || order_params[:address] == ""
          render :new
          return
        end
      end  
       
      
    

  end

  def create

  end

  def index
  end

  def show
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :payment_method, :shipping_cost, :postal_code, :address, :name, :status)
  end
end
