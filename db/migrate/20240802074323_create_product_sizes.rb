class CreateProductSizes < ActiveRecord::Migration[7.1]
  def change
    create_table :product_sizes do |t|
      t.float :price
      t.string :currency
      t.integer :quantity
      t.references :size, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
