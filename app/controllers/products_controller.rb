class ProductsController < ApplicationController
  before_action :load_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/:product_id
  def show
    render json: ProductSerializer.new(@product)
    # render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/:product_id
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/:product_id
  def destroy
    @product.destroy
  end

  private

    def load_product
      @product = Product.find(params[:id])
    end

    def product_params
      p params
      params.permit(:name, :price)
    end
end
