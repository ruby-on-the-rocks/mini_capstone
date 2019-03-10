class Image < ApplicationRecord
  # belongs to product
  def product
    Product.find_by(id: product_id)
  end
end
