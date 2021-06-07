class User < ApplicationRecord
    has_secure_password
    validates :name,  presence: true
    validates :email, presence: true, uniqueness: true
    # ADD MORE RESTRICTIONS TO PASSWORD
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

    def self.from_omniauth(auth)
        binding.pry
        where(email: auth.info.email).first_or_initialize do |user|
            user.user_name = auth.info.name
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end

    
end
