class AddGuestFullNameAndGuestPhoneToTattooRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :tattoo_requests, :guest_full_name, :string
    add_column :tattoo_requests, :guest_phone, :string
  end
end
