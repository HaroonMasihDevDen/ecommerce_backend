class Product < ApplicationRecord
  include ::Ransackable

  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  has_many :cart_items , dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  has_many :product_sizes, dependent: :destroy
  has_many :sizes, through: :product_sizes
  has_many_attached :images
  
  validate :correct_image_type
  validate :acceptable_image_size
  validates :name , presence: true, uniqueness: true
  validates :description, presence: true
  validates :discount_percentage, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }
  validates :discontinued, inclusion: { in: [true, false] }

  def price
    product_sizes.where('quantity > ?',0).order(:price).first&.price
  end

  scope :not_deleted, -> { where(deleted_at: nil) }
  scope :include_size_titles, ->(size_titles) {
    joins(:sizes).where(sizes: { name: size_titles }).distinct
  }

  private

  def correct_image_type
    images.each do |image|
      unless image.content_type.in?(%w[image/png image/jpg image/jpeg])
        errors.add(:images, "must be a PNG, JPG, or JPEG")
      end
    end
  end

  def acceptable_image_size
    images.each do |image|
      if image.byte_size > 5.megabytes
        errors.add(:images, "should be less than 5MB")
      end
    end
  end
end
