class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.integer :project_id
      t.text :notes
      t.string :date
      t.string :time
      t.integer :artist_id
      t.timestamps
    end
  end
end
