class Order < ApplicationRecord

  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }

  validates :payment_method, presence: true
  
  def customer_address_display
  '〒' + postal_code + ' ' + address
  end
  
  def shipping_display
    '〒' + "" +  postal_code  + "" + address + "" + name
  end

end
