class Cart < ApplicationRecord
  has_many :cart_details 
  has_one :order
  
end
