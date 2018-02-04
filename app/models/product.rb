class Product < ApplicationRecord
  
  has_many :categories, through: :category_products
  has_many :category_products
  belongs_to :supplier
  
  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :title, presence: true, uniqueness: true, length: {minimum: 3}
  validates :price, presence: true 
  validates :image_url, presence: true
  validates :description, length: { maximum: 500 }

  # def validate(record)
  #     if record.image_url.starts_with?("http://")
  #       :image_url, uniqueness: true 
  #     end 

  # end 


  # def as_json
  # {
  # title: title, 
  # price: price,
  # image_url: image_url,
  # description: description,
  # is_discounted: is_discounted,
  # tax: tax,
  # total: total  
  # } 
  # end

  def is_discounted
    if price.to_f < 2 
      return true 
    else 
      return false 
    end 
  end  

  def tax 
    tax = price.to_f * 0.09
  end 

  def total 
    total = price.to_f + tax 
  end 

  def as_json
    {
      id: id,
      title: title,
      image_url: image_url,
      price: price,
      description: description,
      tax: tax,
      total: total,
      is_discounted: is_discounted,
      supplier: supplier.as_json,
      categories: categories.map {|category| category.title}
    }
  end 
end
