class RemoveProjectIdFromNotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :notes, :project_id, :integer
  end
end
