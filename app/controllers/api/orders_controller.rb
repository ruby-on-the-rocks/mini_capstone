class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jbuilder"
  end

  def create
    @order = Order.new(
      user_id: current_user.id
    )
    @order.save
    carted_products = current_user.carted_products.where(status: "carted")
    @order.update_totals(carted_products)
    render "show.json.jbuilder"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
end
