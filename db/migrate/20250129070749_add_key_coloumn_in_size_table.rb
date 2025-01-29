class AddKeyColoumnInSizeTable < ActiveRecord::Migration[7.1]
  def change
    add_column :sizes, :key, :string , null: false , default: ""
  end
end
