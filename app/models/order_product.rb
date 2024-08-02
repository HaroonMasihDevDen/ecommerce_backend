class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_many :order_item_vouchers, dependent: :destroy
  has_many :vouchers, through: :order_item_vouchers
end
