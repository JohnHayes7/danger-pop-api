class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :address
      t.boolean :administrator
      t.boolean :tattoo_approved
      t.timestamps
    end
  end
end
