class Note < ApplicationRecord
    belongs_to :tattoo_requests
    belongs_to :projects
end
