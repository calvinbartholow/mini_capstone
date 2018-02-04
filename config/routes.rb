Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  get '/products' => 'products#index'
  post '/products' => 'products#create'

  get '/product/:id' => 'products#show'

  patch '/product/:id' => 'products#update'

  delete '/product/:id' => 'products#destroy'

  post '/users' => 'users#create'
  get '/users' => 'users#index'

  get '/orders' => 'orders#index'
  post '/orders' => 'orders#create'

  get '/categories' => 'categories#index'

  get '/carted_products' => 'carted_products#index'
  post '/carted_products' => 'carted_products#create'
  delete '/carted_products' => 'carted_products#destroy'
  
end
