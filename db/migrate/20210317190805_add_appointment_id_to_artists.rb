class AddAppointmentIdToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :appointment_id, :integer
  end
end
