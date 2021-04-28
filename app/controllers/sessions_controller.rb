class SessionsController < ApplicationController

    def create
        @user = User.find_by(email: session_params[:email])
       
        if @user && @user.authenticate(session_params[:password])
            
          login!
          render json: {
            logged_in: true,
            user: UserSerializer.new(@user)
          }
        else
          render json: { 
            status: 401,
            errors: ['no such user', 'verify credentials and try again or signup']
          }
        end
    end


    def is_logged_in?
        if logged_in? && current_user
          render json: {
            logged_in: true,
            user: UserSerializer.new(current_user)
          }
        else
          render json: {
            logged_in: false,
            message: 'no such user or you need to login'
          }
        end
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


    def destroy
        logout!
        render json: {
          status: 200,
          logged_out: true
        }
    end

    def omniauth
      @user = User.from_omniauth(auth)
      @user.save
      login!
      render json: UserSerializer.new(@user)
    end

    private

    def session_params
        params.require(:user).permit(:username, :email, :password)
    end

end