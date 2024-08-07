class CategoryProduct < ApplicationRecord

  belongs_to :product
  belongs_to :category

  validates :category_id, :product_id, presence: true

end
