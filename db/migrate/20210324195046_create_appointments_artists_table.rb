class CreateAppointmentsArtistsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments_artists do |t|
      t.integer :appointment_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
