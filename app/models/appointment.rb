class Appointment < ApplicationRecord
    belongs_to :artist
    belongs_to :project
    has_one :tattoo_request, through: :project
    belongs_to :user

    
end
