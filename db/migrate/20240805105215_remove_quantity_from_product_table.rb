class RemoveQuantityFromProductTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :quantity, :integer
  end

end
