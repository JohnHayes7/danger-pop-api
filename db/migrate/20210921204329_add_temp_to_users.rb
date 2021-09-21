class AddTempToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :temp, :string
  end
end
