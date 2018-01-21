require 'unirest'

system "clear"

puts "choose an option"
puts "[1] show one product"
puts "[2] show all products"
puts "[3] add a new product"

user_input = gets.chomp 

if user_input == "1" 
  response = Unirest.get("http://localhost:3000/single")
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
  puts "Update the ID of the product" 
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
  
end 
