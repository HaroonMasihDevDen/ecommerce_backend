class Size < ApplicationRecord
  include ::Ransackable

  has_many :product_sizes, dependent: :destroy
  has_many :products, through: :product_sizes

  validates :name, presence: true, uniqueness: true
  validates :key, presence: true, uniqueness: true
  validates :order, presence: true, uniqueness: true

end
