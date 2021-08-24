class AuthController < ApplicationController
    # skip_before_action :require_login, only: [:login, :auto_login]
    def login
        binding.pry
        user = User.find_by(email: params[:user][:email])
        binding.pry
        if user && user.authenticate(params[:user][:password])
          binding.pry
            payload = {user_id: user.id}
            token = encode_token(payload)
            binding.pry
            render json: {user: user, jwt: token, success: "Welcome back, #{user.name}"}
        else
            render json: {failure: "Log in failed! Username or password invalid!"}
        end
      end
    
      def auto_login
        if session_user
          render json: session_user
        else
          render json: {errors: "No User Logged In"}
        end
      end
    
      def user_is_authed
        render json: {message: "You are authorized"}
      end
    
   
end
