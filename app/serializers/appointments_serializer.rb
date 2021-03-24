class AppointmentsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date, :time, :artist_id, :project_id
end
