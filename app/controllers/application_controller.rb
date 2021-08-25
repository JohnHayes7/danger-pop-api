# require remote_pry
class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!, :require_login, :decoded_token, :encode_token

    def login!
        session[:user_id] = @user.id
        puts "login_session: #{session.to_hash}"
    end

    def logged_in?
        # puts "logged_in_session: #{session.to_hash}"
        # !!session[:user_id]
        !!session_user
    end

    def is_logged_in?
        if logged_in?
            render json: {logged_in: true }
        else
            render json: {logged_in: false}
        end
    end

    def current_user
        puts "current_user_session: #{session.to_hash}"
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorized_user?
        @user == current_user
    end

    def logout!
        session.clear
    end

    def auth_header
        request.headers['Authorization']
    end


    def decoded_token
       
        if auth_header
           
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'my_secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                []
            end
        end
    end

    def encode_token(payload)
        JWT.encode(payload, "my_secret")
    end
    
        
    def session_user
        decoded_hash = decoded_token
        if !decoded_hash.empty? 
            puts decoded_hash.class
            user_id = decoded_hash[0]['user_id']
            @user = User.find_by(id: user_id)
        else
            nil 
        end
    end
    
    def require_login
        render json: {message: 'Please Login'}, status: :unauthorized unless logged_in?
    end
    




   
end
