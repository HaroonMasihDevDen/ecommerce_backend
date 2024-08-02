class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name , null: false
      t.float :discount_percentage , :default => 0
      t.string :description, null: true
      t.integer :quantity
      t.boolean :discontinued , :default => false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
