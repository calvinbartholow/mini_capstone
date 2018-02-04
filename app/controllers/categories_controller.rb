class CategoriesController < ApplicationController
  def index 
    cat_input = params[:title]
    category = Category.all.order(id: :asc).where("title LIKE ?","%#{cat_input}#%")
    render json: category.as_json
  end 
end