class Public::FoodsController < ApplicationController

  def show
    @food = Food.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @foods = Food.page(params[:page]).per(8)
    @foods_all = Food.all
  end
end
