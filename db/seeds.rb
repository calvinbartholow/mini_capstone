# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


guayaki = Product.new(title:"Guayaki", price:"1.99", image_url:"https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/2/5/8/0/40852-3-eng-GB/New-Cans-Guayaki.jpg", description:"organic energy")
guayaki.save 

fried_chicken = Product.new(title:"chicken", price:"5.00", image_url:"https://i.ytimg.com/vi/mTGuRxX3ZTo/maxresdefault.jpg", description:"finger lickin good")
fried_chicken.save

