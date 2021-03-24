class AppointmentsSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :artist
  belongs_to :project
  attributes :date, :time, :artist_id, :project_id

end
