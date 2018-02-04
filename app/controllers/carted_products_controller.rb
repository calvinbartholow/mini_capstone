class CartedProductsController < ApplicationController
  def index
    carted_products = current_user.carted_products.where(status: "carted")
    render json: carted_products.as_json
  end 


  def create
    carted = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
      )
    if carted.save 
      render json: carted.as_json 
    else 
      render json:{errors: carted.errors.full_messages}, status: 404
    end 

  end 

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    render json: {status: "Carted Product successfully removed!"}

  end 
end
