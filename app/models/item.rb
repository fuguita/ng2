class Item < ApplicationRecord

  belongs_to :genre

  has_one_attached :item_image

  def get_item_image
    (item_image.attached?) ? item_image : 'no_image.jpg'
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
