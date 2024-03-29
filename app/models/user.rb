class User < ApplicationRecord
    has_secure_password
    # before_validation :downcase_email
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

    # def downcase_email
    #     self.email = email.downcase if email.present?
    # end

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.user_name = auth.info.name
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end

    def generate_password_token!
        self.reset_password_token = generate_token
        self.reset_password_sent_at = Time.now.utc
        save(:validate => false)
    end
       
    def password_token_valid?
        (self.reset_password_sent_at + 4.hours) > Time.now.utc
    end
       
    def reset_password!(password)
        self.reset_password_token = nil
        self.password = password
        save!
    end

    private

    def generate_token
        SecureRandom.hex(10)
    end

    
end
