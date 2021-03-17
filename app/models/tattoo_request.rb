class TattooRequest < ApplicationRecord
    belongs_to :user
    has_many :project
    has_many :notes
end
