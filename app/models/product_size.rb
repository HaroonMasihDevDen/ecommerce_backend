class ProductSize < ApplicationRecord
  include ::Ransackable

  belongs_to :product
  belongs_to :size

  validates :product_id, :size_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :currency, presence: true
  validates :quantity, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates :product_id, uniqueness: { scope: :size_id, message: "product and size combination must be unique" }

  def self.ransackable_attributes(auth_object = nil)
    %w[id product_id size_id price currency quantity created_at updated_at]
  end
end
