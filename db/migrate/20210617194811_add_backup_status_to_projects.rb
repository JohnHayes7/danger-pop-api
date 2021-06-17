class AddBackupStatusToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :backup_project, :boolean
  end
end
