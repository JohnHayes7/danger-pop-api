class Appointment < ApplicationRecord
    has_one :artist
    belongs_to :project
end
