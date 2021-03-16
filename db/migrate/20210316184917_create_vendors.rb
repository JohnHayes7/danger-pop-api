class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_address
      t.string :contact_phone
      t.string :contact_email

      t.timestamps
    end
  end
end
