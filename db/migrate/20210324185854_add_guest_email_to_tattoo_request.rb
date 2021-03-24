class AddGuestEmailToTattooRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :tattoo_requests, :guest_email, :string
  end
end
