class Public::CartItemsController < ApplicationController

  def create
    if customer_signed_in?
        food = cart_item_params[:food_id]
        amount = cart_item_params[:amount]
      if cart_item = current_customer.cart_items.find_by(food_id: food)
           amount = cart_item.amount + amount.to_i
           cart_item.update(amount: amount)
           redirect_to cart_items_path
      else
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id
        @cart_item.save
        redirect_to cart_items_path
      end
    end

  end

  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.delete
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.delete_all
    redirect_to request.referer
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :customer_id, :food_id)
  end

end
