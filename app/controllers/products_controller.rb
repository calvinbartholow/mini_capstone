class ProductsController < ApplicationController

 def index
    products = Product.all 
    render json: products.as_json
  end 

  def create
    new_product = Product.new(title: params[:title], price: params[:price], description: params[:description] )
    new_product.save
    render json: new_product.as_json
  end 

  def show
    product = Product.find_by(title:params["product"])


    render json: (product.as_json) 
  end 

  def update
    product = Product.find_by(id: params["id"])
    product.update(
      title: params[:title], price: params[:price], description: params[:description]
      )
    render json: (product.as_json)

  end 

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "RECIPE SUCCESSFULLY DESTROYED MUAHAHAHA"}

  end 
end
