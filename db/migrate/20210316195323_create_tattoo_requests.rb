class CreateTattooRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :tattoo_requests do |t|
      t.integer :user_id
      t.text  :description
      t.string :body_location_image_path
      t.boolean :accepted
      t.text :notes
      t.timestamps
    end
  end
end
