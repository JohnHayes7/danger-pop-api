class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :id_img_path, :string
    add_column :users, :allergies, :string
  end
end
