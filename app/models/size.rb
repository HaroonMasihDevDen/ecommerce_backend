class Size < ApplicationRecord
  has_many :product_sizes, dependent: :destroy
  has_many :products, through: :product_sizes

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
  def self.ransackable_associations()
    ["products","product_sizes"]
  end
end
