class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
      orders = current_user.orders
      if orders
      render json: orders.as_json
    else 
      render json: {message: "You must be logged in to see orders!"}
    end 

  end 

  def create
    carted_products = current_user.carted_products.where(status: "carted")
    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal = carted_product.product.price * carted_product.quantity 
    end 
    calculated_tax = calculated_subtotal * 0.09 
    calculated_total += calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity], 
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
      )

    if order.save
      carted_products.update_all(status: "purchased", order_id: order.id) 
      render json: order.as_json
    else 
      render json: {errors: order.errors.full_messages}, status: 422
    end 
  end 

end