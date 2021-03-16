class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :tattoo_request_id
      t.text :notes
      t.string :progress_pic_folder
      t.string :final_image
      t.boolean :project_complete_status
      t.timestamps
    end
  end
end
