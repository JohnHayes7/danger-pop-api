class User < ApplicationRecord
    has_secure_password
    validates :name, :password, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    has_one :cart
    has_many :tattoo_requests
    belongs_to :store
end
