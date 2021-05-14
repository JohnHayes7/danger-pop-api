class Removeprogressimagesfromprojects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :progress_pic_folder, :string
  end
end
