class ProjectsSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :tattoo_request
  belongs_to :user
  belongs_to :artist
  has_many :appointments
  has_many :project_notes
  attributes :title, :progress_pic_folder, :final_image, :project_complete_status, :tattoo_request, :user, :artist, :appointments, :project_notes
end
