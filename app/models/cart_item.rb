class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :food

  def subtotal
    food.tax_in_price * amount
  end

  def tax_in_price
    (food.price*1.10).floor
  end

end
