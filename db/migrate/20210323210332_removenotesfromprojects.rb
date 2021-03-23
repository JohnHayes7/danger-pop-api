class Removenotesfromprojects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :notes, :string
  end
end
