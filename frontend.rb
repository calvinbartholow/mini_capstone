require 'unirest'
while true 
system "clear"

puts "choose an option"
puts "[1] show one product"
puts "[1.5] search all products by title"
puts "[2] show all products"
puts "[3] add a new product"
puts "[4] update the ID of a product"
puts "[5] DELETE A PRODUCT"
puts "[6] SIGN UP FOR OUR SERVICE "
puts "[7] LOGIN TO YOUR ACCOUNT" 
puts "[8] LOGOUT"
puts "[9] Create an order"
puts "[10] See all my orders"
puts "[11] Search all products by category"
puts "[12] Add items to the cart"
puts "[cart] to see your carted products" 
puts "[q] to quit"
user_input = gets.chomp 

if user_input == "1" 
  puts "Enter product id to show"
  input_id = gets.chomp
  response = Unirest.get("http://localhost:3000/single")
  product = response.body 
  puts JSON.pretty_generate(product)
  puts "press enter to continue or type 'c' to add to cart: "
  if gets.chomp == "c" || gets.chomp =="C"
    puts "Enter quantity to add to cart: "
    quantity = gets.chomp 
    params = {
      quantity: quantity, 
      product_id: input_id
    }
    response = unirest.post("http://localhost:3000/carted_products", parameters: params)
    carted_product = response.body 
    render JSON.pretty_generate(carted_product)
  end 
elsif user_input == "1.5"
  puts "What's the title of the product?: "
  search_opt = gets.chomp 
  if search_opt 
    response = Unirest.get("http://localhost:3000/products?search=#{search_opt}")
  else
    response = Unirest.get("http://localhost:3000/products")
  end 
  product = response.body
  puts JSON.pretty_generate(product)
elsif user_input == "2"
  response = Unirest.get("http://localhost:3000/all") 
  products = response.body 
  puts JSON.pretty_generate(products)
elsif user_input == "3"
  params = {}
  puts "Enter a name for your new product: " 
  params["title"] = gets.chomp
  puts "Enter a price for your new product: " 
  params["price"] = gets.chomp
  puts "Enter a description for your new product: " 
  params["description"] = gets.chomp
  params.delete_if {|key,value| value.empty? }
  response = Unirest.post("http://localhost:3000/products", parameters: params)
  product = response.body
  puts JSON.pretty_generate(product)
elsif user_input == "4"
  params = {}
  puts "Enter the ID of the product" 
  input_id = gets.chomp 
  response = Unirest.get("http://localhost:3000/products/#{input_id}")
  product = response.body
  #puts JSON.pretty_generate(product)
  puts "Update the product name from (#{product['title']}): "
  params["title"] = gets.chomp 
  puts "Update the product price from (#{product['price']}): "
  params["price"] = gets.chomp
  puts "Update the product description from (#{product['description']}): "
  params["description"] = gets.chomp
  params.delete_if {|key,value| value.empty? }
  response = Unirest.patch("http://localhost:3000/products/#{input_id}", parameters: params)
  updated_recipe = response.body
  puts JSON.pretty_generate(updated_recipe)
elsif user_input == "5"
  params = {}
  puts "Enter the ID of the product you wish to delete"
  input_id = gets.chomp 
  response = Unirest.delete("http://localhost:3000/products/#{input_id}")
  puts JSON.pretty_generate(response.body)
elsif user_input == "6"
  params = {}
  puts "Full Name: "
  params[:name] = gets.chomp
  puts "Email: "
  params[:email] = gets.chomp 
  puts "Password: " 
  params[:password] = gets.chomp
  response = Unirest.post("http://localhost:3000/users", parameters: params)
  puts JSON.pretty_generate(response.body)
elsif user_input == "7"
  puts "LOGIN"
  puts "User Email: "
  input_email = gets.chomp 
  puts "Enter Password: "
  input_password = gets.chomp!

  response = Unirest.post("http://localhost:3000/user_token", 
  parameters: {
    auth: {
      email: input_email,
      password: input_password
    }
  }
  )
  jwt = response.body["jwt"]
  puts jwt
  Unirest.default_header("Authorization", "Bearer #{jwt})")
  puts JSON.pretty_generate(jwt)
elsif user_input == "8"
  jwt = ""
  Unirest.clear_default_headers()
elsif user_input == "9"
  puts "Create a new order: " 
  puts "Enter a product id: "
  input_product_id = gets.chomp
  puts "Enter quantity: "
  input_quantity = gets.chomp
  response = Unirest.post("http://localhost:3000/orders", parameters: {product_id: input_product_id, quantity: input_quantity})
  order = response.body
  render JSON.pretty_generate(order)
elsif user_input == "10"
  puts "Here's all your orders"
  response = Unirest.get("http://localhost:3000/orders")
  orders = response.body
  puts JSON.pretty_generate(orders)
elsif user_input == "11"
  puts "Which category ya lookin' for "
  cat_input = gets.chomp 
elsif user_input == "cart"
  puts "Here are all the items in your shopping cart: "
  response = Unirest.get("http://localhost:3000/carted_products")
  carted_products = response.body 
  puts JSON.pretty_generate(carted_products)
  puts "press enter to continue or press 'o' to place the order, or press r to remove a product from your cart "
  if gets.chomp == "o"
    response = Unirest.post("http://localhost:3000/orders")
    order = response.body 
    puts JSON.pretty_generate(order)
  elsif gets.chomp == "r"
    puts "enter id of carted product to remove: "
    id = gets.chomp 
    response = Unirest.delete("http://localhost:3000/carted_products/#{id}")
    puts JSON.pretty_generate(response.body)
  end 
elsif user_input == "q" || user_input == "quit"
  puts "Goodbye!"
  break 



end 
end 
