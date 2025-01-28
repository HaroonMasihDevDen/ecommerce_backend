class DropImagesTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :images
  end

  def down
    create_table :images do |t|
      t.references :product
      t.string :image_url
      t.timestamps
    end
  end
end
