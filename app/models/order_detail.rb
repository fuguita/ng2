class OrderDetail < ApplicationRecord

  belongs_to :food
  belongs_to :order

  enum making_status: { just_ordered: 0, wait_makings: 1, making: 2, made_up: 3, done: 4 }


end
