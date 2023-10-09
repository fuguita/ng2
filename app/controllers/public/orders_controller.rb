class Public::OrdersController < ApplicationController

  def new
    @order = Order.new

  end

  def check
        @order = Order.new(order_params)
      if params[:order][:payment_method] == nil
         render :new
         return
      end
      if params[:order][:address_number] == "0"
         @order.address = current_customer.address
         @order.postal_code = current_customer.postal_code
         @order.name = current_customer.full_name
         @order.customer_id = current_customer.id
      elsif params[:order][:address_number] == "1"
        if params[:order][:shipping_id] == ""
          render :new
          return
        end
         @shipping = Shipping.find(params[:order][:shipping_id])
         @order.postal_code = @shipping.postal_code
         @order.address = @shipping.address
         @order.name = @shipping.name
      elsif params[:order][:address_number] == "2"
        if order_params[:postal_code] == "" || order_params[:name] == "" || order_params[:address] == ""
          render :new
          return
        end
      end
      @cart_items = current_customer.cart_items.all
      @total = 0
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
