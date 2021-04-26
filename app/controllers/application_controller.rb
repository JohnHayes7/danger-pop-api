class ApplicationController < ActionController::API

    before_action :authenticate

    def authenticate
        # binding.pry
        if request.headers["Authorization"]

            begin
                binding.pry
                auth_header = request.headers["Authorization"]
                
                decoded_token = JWT.decode(token(auth_header), secret)
        
                payload = decoded_token.first
                
                user_id = payload["user_id"]
                binding.pry
                @user = User.find(user_id)
                binding.pry
            rescue => exception
                render json: {message: "Error #{exception}"}, status: :forbidden
            end
        else
            render json:{message: "No Authorization Header Sent", status: :forbidden}
        end
    end

    def secret
        secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
    end

    def token(auth_header)
        auth_header.split(" ")[1]
    end

    def create_token(payload)
        JWT.encode(payload, secret)
    end


   
end
