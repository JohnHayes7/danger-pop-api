class AddProgressImagesToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :progress_images, :string, array: true, default: []
  end
end
