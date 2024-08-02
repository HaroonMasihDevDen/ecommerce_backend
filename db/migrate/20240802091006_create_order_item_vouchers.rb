class CreateOrderItemVouchers < ActiveRecord::Migration[7.1]
  def change
    create_table :order_item_vouchers do |t|
      t.references :voucher, null: false, foreign_key: true
      t.references :order_product, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
