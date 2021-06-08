class AddNameAndOpenStateToRequestWindows < ActiveRecord::Migration[6.1]
  def change
    add_column :request_windows, :name, :string
    add_column :request_windows, :openState, :boolean
  end
end
