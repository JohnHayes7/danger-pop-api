class Project < ApplicationRecord
    belongs_to :tattoo_request
    has_many :appointments
    has_many :notes
end
