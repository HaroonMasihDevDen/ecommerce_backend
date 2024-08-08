class Voucher < ApplicationRecord
  has_many :order_vouchers, dependent: :destroy
  has_many :orders, through: :order_vouchers
  has_many :order_product_vouchers, dependent: :destroy
  has_many :order_products, through: :order_product_vouchers
end
