class RemoveTempPasswordFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :temp_password
  end
end
