class Store < ApplicationRecord
    has_many :vendors
    has_many :users
end
