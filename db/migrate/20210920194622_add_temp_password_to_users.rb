class AddTempPasswordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :temp_password, :string
  end
end
