class Appointment < ApplicationRecord
    belongs_to :artist
    belongs_to :project
end
