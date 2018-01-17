require 'unirest'

puts "choose an option"
puts "[1] show one product"
puts "[2] show all products"

user_input = gets.chomp 

if user_input == 1 
  response = Unirest.get()
end 