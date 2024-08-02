class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  has_one :payments, dependent: :destroy
  has_many :order_vouchers, dependent: :destroy
  has_many :vouchers, through: :order_vouchers
end
