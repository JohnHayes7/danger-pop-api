class User < ApplicationRecord
    has_secure_password
    validates :name,  presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    has_one :cart
    has_many :products, through: :cart
    has_many :tattoo_requests
    has_many :projects, through: :tattoo_requests
    has_many :appointments, through: :projects
    belongs_to :store

    def name_combine
        combined = ""
        self.name.split(" ").each do |n|
            combined += n
        end
        combined
    end
end
