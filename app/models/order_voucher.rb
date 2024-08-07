class OrderVoucher < ApplicationRecord
  belongs_to :voucher
  belongs_to :order
end
