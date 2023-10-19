class OrderDetail < ApplicationRecord

  belongs_to :food
  belongs_to :order

  enum making_status: { just_ordered: 0, wait_making: 1, makingss: 2, made_up: 3 }


end
