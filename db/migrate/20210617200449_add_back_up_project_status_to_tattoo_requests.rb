class AddBackUpProjectStatusToTattooRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :tattoo_requests, :backup_project, :boolean
    add_column :tattoo_requests, :declined, :boolean
  end
end
