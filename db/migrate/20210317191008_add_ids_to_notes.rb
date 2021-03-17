class AddIdsToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :tattoo_request_id, :integer
    add_column :notes, :project_id, :integer
  end
end
