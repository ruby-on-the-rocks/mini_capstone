class Api::ProductsController < ApplicationController
  def all_products_method
    @products = Product.all
    render "all_products.json.jbuilder"
  end

  def one_product_method
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    render "one_product.json.jbuilder"
  end
end
