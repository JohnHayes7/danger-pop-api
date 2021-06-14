class AppointmentsSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :artist
  belongs_to :project
  has_one :user, through: :project
  has_one :tattoo_request, through: :project
  attributes :project, :artist, :user, :tattoo_request, :date, :time, :daypart, :length_time, :artist_id, :project_id

end
