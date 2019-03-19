class Api::CartedProductsController < ApplicationController
  def index
    # @carted_products = []
    # all_carted_products= CartedProduct.all
    # all_carted_products.each do |carted_product|
    #   if carted_product.user_id == current_user.id && carted_product.status == "carted"
    #     @carted_products << carted_product
    #   end
    # end
    # @carted_products = CartedProduct.where(user_id: current_user.id).where(status: "carted")
    # @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    @carted_products = current_user.carted_products.where(status: "carted")
    render "index.json.jbuilder"
  end

  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted",
    )
    @carted_product.save
    render "show.json.jbuilder"
  end

  def destroy
    @carted_product = current_user.carted_products.find_by(id: params[:id])
    @carted_product.status = "removed"
    @carted_product.save
    render json: {message: "Carted product successfully removed!"}
  end
end
