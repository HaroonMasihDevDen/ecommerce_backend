class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :size
  belongs_to :user
end
