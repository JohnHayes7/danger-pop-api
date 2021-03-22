class ProductsSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :products_sizes do |t|
      t.integer :product_id
      t.integer :size_id
      t.timestamps
    end
  end
end
