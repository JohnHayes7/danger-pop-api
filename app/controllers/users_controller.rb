class UsersController < ApplicationController

    # skip_before_action :authenticate, only:[:create]


    
    def index
        users = User.all
        render json: UserSerializer.new(users)
    end

    def create
       
        @user = User.new(user_params)
        # binding.pry
        if @user.save
            login!
            render json: UserSerializer.new(@user)
        else
            # binding.pry
            render json: {code: 2020, message: "Could Not Create Account.  Please confirm your information"}
        end
    end

    def show
        u = User.find(params[:id])

        render json: UserSerializer.new(u)
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :email, :phone_number, :password)
    end


end
