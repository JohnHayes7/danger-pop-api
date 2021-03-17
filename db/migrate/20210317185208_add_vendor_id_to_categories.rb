class AddVendorIdToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :vendor_id, :integer
  end
end
