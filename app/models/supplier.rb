class Supplier < ApplicationRecord
  # has many products
  def products
    Product.where(supplier_id: id)
  end
end
