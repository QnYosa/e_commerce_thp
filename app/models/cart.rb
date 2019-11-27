class Cart < ApplicationRecord
  has_many :cart_details 
  has_many :items, through: :cart_details
  has_one :order
  belongs_to :user
end
