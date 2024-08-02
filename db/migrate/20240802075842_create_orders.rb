class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :status , :default => "placed"
      t.float :grand_total
      t.float :final_total
      t.references :user, null: false, foreign_key: true
      t.text :delivery_address
      t.text :payment_address
      t.string :payment_method
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
