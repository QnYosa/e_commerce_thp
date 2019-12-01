class CartDetail < ApplicationRecord
  belongs_to :cart
  belongs_to :item
end
