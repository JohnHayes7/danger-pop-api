class Artist < ApplicationRecord
    has_and_belongs_to_many :appointments
    has_many :projects, through: :appointments
end