class Artist < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    # ADD MORE RESTRICTIONS TO PASSWORD
    validates :password, presence: true
    has_and_belongs_to_many :appointments
    has_many :projects, through: :appointments
    has_many :users, through: :projects
end
