class Food < ApplicationRecord

  belongs_to :genres

  has_one_attached :food_image

  def get_food_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def tax_in_price
    (price*1.10).floor
  end

  def active_judge
    if is_active
      return "販売中"
    else
      return "販売停止中"
    end
  end

end
