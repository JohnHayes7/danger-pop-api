class TattooRequestsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :guest_email, :description, :body_location_image_path, :accepted, :project, :notes, :allergies
end
