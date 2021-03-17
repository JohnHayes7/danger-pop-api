class AddStoreIdToVendors < ActiveRecord::Migration[6.1]
  def change
    add_column :vendors, :store_id, :integer
  end
end
