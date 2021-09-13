class AddDeclinedReason < ActiveRecord::Migration[6.1]
  def change
    add_column :tattoo_requests, :declined_reason, :string
  end
end
