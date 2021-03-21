class CategoriesVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :categories_vendors, :id => false do |t|
      t.integer :category_id
      t.integer :vendor_id
    end
  end
end
