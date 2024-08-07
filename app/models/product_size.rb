class ProductSize < ApplicationRecord
  belongs_to :products
  belongs_to :sizes
end
