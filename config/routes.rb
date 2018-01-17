Rails.application.routes.draw do
  get "/single" => "products#single_product"
  get "all" => "products#all_products"
end
