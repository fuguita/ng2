class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, paid_up: 1, making: 2, preparing: 3, shipped: 4 }

  validates :payment_method, presence: true

  def customer_address_display
  '〒' + postal_code + ' ' + address
  end

  def shipping_display
    '〒' + "" +  postal_code  + "" + address + "" + name
  end

  def shipping_cost
    800
  end

end
