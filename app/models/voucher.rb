class Voucher < ApplicationRecord
  include ::Ransackable

  validates :token, presence: true, uniqueness: true
  validates :applied_type, :discount_type, presence: true
  validates :discount_value , presence: true , numericality: {greater_than_or_equal_to:1}
  validates :cap_amount, presence: true , numericality: true

  has_many :order_vouchers, dependent: :destroy
  has_many :orders, through: :order_vouchers
  has_many :order_product_vouchers, dependent: :destroy
  has_many :order_products, through: :order_product_vouchers



end
