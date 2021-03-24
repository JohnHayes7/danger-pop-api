class ArtistsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :phone, :social_details, :appointment_id
end
