class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products
  has_many :carted_products
end
