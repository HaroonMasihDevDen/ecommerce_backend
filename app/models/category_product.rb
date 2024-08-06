class CategoryProduct < ApplicationRecord
  belongs_to :product
  belongs_to :category

  validates :category_id, presence: true
  validates :product_id, presence: true
end
