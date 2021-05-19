class AddLengthTimeToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :length_time, :string
  end
end
