class DimensionProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products_dimensions do |t|
      t.integer :product_id
      t.integer :dimension_id
      t.timestamps
    end
  end
end
