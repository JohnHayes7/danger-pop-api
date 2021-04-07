class AddAllergiesToTattooRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :tattoo_requests, :allergies, :string
  end
end
