class AddMockUpImageLocationToTattooRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :tattoo_requests, :mockupImageLocation, :string
  end
end
