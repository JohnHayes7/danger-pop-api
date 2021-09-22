class AuthController < ApplicationController
    # skip_before_action :require_login, only: [:login, :auto_login]
    helper_method :login
    def login
        # binding.pry
        user = User.find_by(email: params[:user][:email])
        
        if user && user.authenticate(params[:user][:password])
            # binding.pry
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Welcome back, #{user.name}"}
        else
            render json: {failure: "Log in failed! Username or password invalid!"}
        end
      end
    
      def auto_login
       
        if session_user
          render json: UserSerializer.new(session_user)
        else
          render json: {errors: "No User Logged In"}
        end
      end
    
      def user_is_authed
        render json: {message: "You are authorized"}
      end

      def is_authorized_user?
        
        user = User.find(params[:user_id][:id])
       
        if user == current_user
            render json: {
                authorized: true
            }
        else
            render json:{
                authorized: false
            }
        end
    end
    
   
end
