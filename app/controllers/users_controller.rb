class UsersController < ApplicationController

    
    def index
        users = User.all
        render json: UserSerializer.new(users)
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: UserSerializer.new(user)
        else
            render json: {code: 2020, message: "Could Not Create Account.  Please confirm your information"}
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :email, :phone_number, :password)
    end


end
