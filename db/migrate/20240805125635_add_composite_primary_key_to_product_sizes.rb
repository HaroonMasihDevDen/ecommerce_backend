class AddCompositePrimaryKeyToProductSizes < ActiveRecord::Migration[7.1]
  # def up
  #   # Remove existing primary key constraint if it exists
  #   remove_index :product_sizes, column: [:product_id, :size_id], if_exists: true

  #   # Add new primary key constraint using both columns
  #   execute <<-SQL
  #     ALTER TABLE product_sizes
  #     DROP CONSTRAINT IF EXISTS product_sizes_pkey;

  #     ALTER TABLE product_sizes
  #     ADD PRIMARY KEY (product_id, size_id);
  #   SQL
  # end

  # def down
  #   # Revert the primary key constraint to the previous state
  #   execute <<-SQL
  #     ALTER TABLE product_sizes
  #     DROP CONSTRAINT IF EXISTS product_sizes_pkey;

  #     ALTER TABLE product_sizes
  #     ADD PRIMARY KEY (id); -- Assuming `id` was the previous primary key
  #   SQL

  #   # Optionally, re-add the index if it was present before
  #   add_index :product_sizes, [:product_id, :size_id], if_not_exists: true
  # end
end
