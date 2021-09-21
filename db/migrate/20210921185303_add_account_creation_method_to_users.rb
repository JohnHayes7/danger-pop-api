class AddAccountCreationMethodToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :account_creation_method, :string
  end
end
