class User < ApplicationRecord
    has_secure_password
    validates :name, :password, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    has_one :cart
    has_many :tattoo_requests
    has_many :projects, through: :tattoo_requests
    has_many :appointments, through: :projects
    belongs_to :store
end
