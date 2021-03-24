class ProjectsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :tattoo_request, :progress_pic_folder, :final_image, :project_complete_status, :title, :user, :artist
end
