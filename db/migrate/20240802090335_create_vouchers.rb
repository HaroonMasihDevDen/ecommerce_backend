class CreateVouchers < ActiveRecord::Migration[7.1]
  def change
    create_table :vouchers do |t|
      t.string :token
      t.string :applied_type
      t.string :discount_type
      t.float :discount_value
      t.float :cap_amount
      t.boolean :discontinued , :default => false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
