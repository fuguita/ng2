class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :food

  def subtotal
    food.tax_in_price * amount
  end
  
  

end
