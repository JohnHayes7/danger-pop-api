class Removefinalimagefromprojects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :final_image, :string
  end
end
