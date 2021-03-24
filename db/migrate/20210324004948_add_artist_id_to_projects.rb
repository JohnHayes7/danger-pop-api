class AddArtistIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :artist_id, :integer
  end
end
