class Remove < ActiveRecord::Migration[6.1]
  def change
    remove_column :request_windows, :tattoo_request_window, :boolean
  end
end
