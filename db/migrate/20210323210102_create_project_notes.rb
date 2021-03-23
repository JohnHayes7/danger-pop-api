class CreateProjectNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :project_notes do |t|
      t.integer :project_id
      t.text :content
      t.timestamps
    end
  end
end
