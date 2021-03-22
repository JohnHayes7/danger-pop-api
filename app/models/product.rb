class Product < ApplicationRecord
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :carts
    has_many :users, through: :carts
    has_and_belongs_to_many :sizes
    has_and_belongs_to_many :dimensions
end
