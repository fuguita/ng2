class Public::OrdersController < ApplicationController

  def new
    @order = Order.new

  end

  def check
    @order = Oreder.new(order_params)

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
