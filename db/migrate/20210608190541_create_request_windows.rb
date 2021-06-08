class CreateRequestWindows < ActiveRecord::Migration[6.1]
  def change
    create_table :request_windows do |t|
      t.boolean :tattoo_request_window, :default => true
      t.timestamps
    end
  end
end
