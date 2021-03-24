class RemoveCategoryProducts < ActiveRecord::Migration[6.1]
  def change
    drop_table :category_products
  end
end
