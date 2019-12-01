class Item < ApplicationRecord
    has_many :cart_details 
    has_many :carts, through: :cart_details
    validates :title, presence: true 
    validates :description, presence: true 
    validates :price, presence: true 
    validates :image_url, presence: true 
    has_one_attached :avatar
end
