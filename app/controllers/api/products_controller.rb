class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all

    if params["search"]
      @products = @products.where("name ILIKE ?", "%#{params["search"]}%")
    end

    if params["discount"]
      @products = @products.where("price < ?", 10)
    end

    if params["sort"] == "price" && params["sort_order"] == "asc"
      @products = @products.order(:price => :asc)
    elsif params["sort"] == "price" && params["sort_order"] == "desc"
      @products = @products.order(:price => :desc)
    else
      @products = @products.order(:id => :desc)
    end

    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: 1
    )
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed!"}
  end
end
