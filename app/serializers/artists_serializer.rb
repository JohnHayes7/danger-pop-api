class ArtistsSerializer
  include FastJsonapi::ObjectSerializer
  has_many :appointments
  has_many :projects, through: :appointments
  has_many :users, through: :projects
  attributes :name, :email, :phone, :social_details, :appointment_id
end
