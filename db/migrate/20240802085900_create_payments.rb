class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.float :amount
      t.string :payment_method
      t.string :status , :default =>  "pending"
      t.string :currency , :default => "PKR"
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
