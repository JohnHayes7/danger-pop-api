class AddImageFileToTattooRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :tattoo_requests,:image_file_name, :string
    add_column :tattoo_requests,:image_content_type, :string
    add_column :tattoo_requests,:image_file_size, :integer
    add_column :tattoo_requests,:image_updated_at, :datetime
  end
end
