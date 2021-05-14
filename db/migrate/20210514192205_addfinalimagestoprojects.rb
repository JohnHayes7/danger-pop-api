class Addfinalimagestoprojects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :final_images, :string, array: true, default: []
  end
end
