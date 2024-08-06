class ProductSize < ApplicationRecord
  belongs_to :product
  belongs_to :size

  def self.ransackable_attributes(auth_object = nil)
    ["price", "currency", "quantity","product_id","size_id", "created_at", "updated_at", "deleted_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["product", "size"]
  end
end
