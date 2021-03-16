class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :size
      t.integer :price
      t.integer :quantity
      t.integer :shipping_height
      t.integer :shipping_weight
      t.string :image_folder
      t.timestamps
    end
  end
end
