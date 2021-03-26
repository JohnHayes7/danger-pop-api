class AppointmentsSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :artist
  belongs_to :project
  has_one :user, through: :project
  attributes :project, :artist, :user, :date, :time, :artist_id, :project_id

end
