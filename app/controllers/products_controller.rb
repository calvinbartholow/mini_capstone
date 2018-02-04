class ProductsController < ApplicationController

  before_action :authenticate_admin, except:[:index, :show]

 def index
    products = Product.all.order(id: :asc)
    search_title = params[:title]
    search_price = params[:price]
    if search_title
      products = Product.all.order(id: :asc).where("title LIKE ?", "%#{search_title}%")
    end 
    search_price = params[:price]
    if search_price 
      products = Product.all.where("price LIKE ?", '%#{search_price}%')
    end 

    render json: products.as_json
  end 

  def create
    
    new_product = Product.new(title: params[:title], price: params[:price], description: params[:description] )
      if new_product.save
        render json: new_product.as_json
      else 
        render json: {errors: product.errors.full_messages, status: :unprocessable_entity}
      end 
    else 
      render json:{message: "Unauthorized action"}, status: :unauthorized
  end 

  def show
    product = Product.find_by(title:params[:product])


    render json: (product.as_json) 
  end 

  def update
      product = Product.find_by(id: params[:id])
      product.update(
       title: params[:title], price: params[:price], description: params[:description]
      )
      if product.update?
        render json: (product.as_json)
      else 
        render json: {errors: product.errors.full_messages, status: :unprocessable_entity}
      end  
  end 

  def destroy
      product = Product.find_by(id: params[:id])
      product.destroy
      render json: {message: "RECIPE SUCCESSFULLY DESTROYED MUAHAHAHA"}
  end 
end
