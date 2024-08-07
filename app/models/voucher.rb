class Voucher < ApplicationRecord
  has_many :order_vouchers, dependent: :destroy
  has_many :orders, through: :order_vouchers
  has_many :order_item_vouchers, dependent: :destroy
  has_many :order_products, through: :order_item_vouchers
end
