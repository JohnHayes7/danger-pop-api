class TattooRequestsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :guest_full_name, :guest_phone, :guest_email, :description, :body_location_image_path, :accepted, :backup_project, :project, :notes, :allergies, :created_at
end
