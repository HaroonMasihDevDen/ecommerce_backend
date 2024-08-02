class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :parent_category_id, index: true

      t.timestamps
    end

    add_foreign_key :categories, :categories, column: :parent_category_id
  end
end
