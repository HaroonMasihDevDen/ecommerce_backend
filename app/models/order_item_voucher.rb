class OrderItemVoucher < ApplicationRecord
  belongs_to :voucher
  belongs_to :order_product
end
