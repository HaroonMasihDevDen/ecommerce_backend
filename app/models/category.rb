class Category < ApplicationRecord
  include ::Ransackable

  has_many :category_products, dependent: :destroy
  has_many :products, through: :category_products
  belongs_to :parent_category, class_name: 'Category', optional: true
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_category_id', dependent: :destroy

  validates :name , presence: true , uniqueness: true

  def self.find_all_child_ids(parent_id)
    parent_category = Category.find(parent_id)
    child_ids = []
    find_children_ids(parent_category, child_ids)
    child_ids
  end

  private

  def self.find_children_ids(category, child_ids)
    child_ids << category.id
    category.subcategories.each do |subcategory|
      find_children_ids(subcategory, child_ids)
    end
  end

end
