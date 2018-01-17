require 'unirest'

puts "choose an option"
puts "[1] show one product"
puts "[2] show all products"

user_input = gets.chomp 

if user_input == "1" 
  response = Unirest.get("http://localhost:3000/single")
  product = response.body 
  puts JSON.pretty_generate(product)
elsif user_input == "2"
  response = Unirest.get("http://localhost:3000/all") 
  products = response.body 
  puts JSON.pretty_generate(products)
end 
