class SuppliersController < ApplicationController

  def index 
    suppliers = Supplier.all 
    render json: suppliers.as_json
  end 

  def create
    new_supplier = Supplier.create(name: params[:name], )

  end 
end
