class UsersController < ApplicationController

    skip_before_action :authenticate, only:[:create]


    
    def index
        users = User.all
        render json: UserSerializer.new(users)
    end

    def create
       
        @user = User.new(user_params)
        # binding.pry
        if @user.save
            # binding.pry
            payload = {user_id: @user.id}
            token = create_token(payload)
            user_data ={
                "id": @user.id,
                "name": @user.name,
                "email": @user.email,
                "token": token
            }
            # options = {include: [token]}
            # binding.pry
            render json: user_data
        else
            # binding.pry
            render json: {code: 2020, message: "Could Not Create Account.  Please confirm your information"}
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :email, :phone_number, :password)
    end


end
