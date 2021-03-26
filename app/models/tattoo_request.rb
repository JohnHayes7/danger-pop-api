class TattooRequest < ApplicationRecord
    belongs_to :user
    has_one :project
    has_many :notes

    
end
