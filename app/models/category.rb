class Category < ApplicationRecord
  has_many :category_products, dependent: :destroy
  has_many :products, through: :category_products
  belongs_to :parent_category, class_name: 'Category', optional: true
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_category_id', dependent: :destroy

  validates :name , presence: true , uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ['name','description', 'parent_category_id' , 'created_at','updated_at', 'deleted_at']
  end

  def self.ransackable_associations(auth_object = nil)
    ["category_products", "parent_category", "products", "subcategories"]
  end

end
