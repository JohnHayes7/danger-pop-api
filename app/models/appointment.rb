class Appointment < ApplicationRecord
    belongs_to :artist
    belongs_to :project
    belongs_to :user

    
end
