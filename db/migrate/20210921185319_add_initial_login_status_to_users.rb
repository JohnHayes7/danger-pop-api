class AddInitialLoginStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :inital_login, :boolean, :default => false
  end
end
