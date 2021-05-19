class AddDaypartToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :daypart, :string
  end
end
