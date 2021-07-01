class ProjectsSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :tattoo_request
  belongs_to :user
  belongs_to :artist
  has_many :appointments
  has_many :project_notes
  attributes :title, :progress_images, :final_images, :project_complete_status, :deposit_received_status, :tattoo_request, :user, :artist, :appointments, :project_notes


  
end
