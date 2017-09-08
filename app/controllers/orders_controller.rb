class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/:order_id

  def show
    render json: OrderSerializer.prodnew(@order)
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/:order_id
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/:order_id
  def destroy
    @order.destroy
  end

  # OPTIONS /orders
  def option
    render json: doc_usage
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.permit(:count, :product_id)
    end

    def doc_usage
      ["GET", "POST", "PUT", "PATCH", "DELETE"].each do |method|
        begin
          definition = Rails.application.routes.recognize_path("/products", {method: method})
          definition = Rails.application.routes.recognize_path("/products/:id", {method: method})
          p definition
          # p self.method(definition[:action]).source_location
        rescue ActionController::RoutingError => _e
          nil
        end
      end

      {
        "GET": {
          "summary": "show all orders.",
          "request": {
            "parameters": {
            },
          }
        },
        "POST": {
          "summary": "create an order.",
          "request": {
            "parameters": {
              "id": {
                "type": "integer",
                "description": "product id to order"
              },
              "count": {
                  "type": "integer",
                  "description": "quantity count to order"
              }
            },
          }
        }
      }
    end
end
