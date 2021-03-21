class Project < ApplicationRecord
    belongs_to :tattoo_request
    belongs_to :user
    belongs_to :artist
    has_many :appointments
    has_many :notes
end
