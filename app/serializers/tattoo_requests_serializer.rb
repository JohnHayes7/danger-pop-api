class TattooRequestsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :description, :body_location_image_path, :accepted
end
