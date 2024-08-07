class RenameOrderItemVoucherTable < ActiveRecord::Migration[7.1]
  def change
    rename_table :order_item_vouchers, :order_product_vouchers

  end
end
