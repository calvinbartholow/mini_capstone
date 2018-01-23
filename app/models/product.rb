class Product < ApplicationRecord

  def as_json
  {
  title: title, 
  price: price,
  image_url: image_url,
  description: description,
  is_discounted: is_discounted,
  tax: tax,
  total: total  
  } 
  end

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
end
