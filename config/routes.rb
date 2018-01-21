Rails.application.routes.draw do
  get "/products" => "products#index"
  post "/products" => "products#create"

  get "/product/:product" => "products#show"

  patch "/product/:id" => "products#update"

  delete "/product/:id" => "products#destroy"
end
