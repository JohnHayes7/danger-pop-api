class UsersController < ApplicationController    
    def index
        users = User.all
        render json: UserSerializer.new(users)
    end

    def create
       
        @user = User.new(user_params)
        if @user.save
            login!
            UserMailer.welcome_email(@user).deliver_now
            render json: UserSerializer.new(@user)
        else
            render json: {code: 2020, message: "Could Not Create Account.  Please confirm your information"}
        end
    end

    def show
        u = User.find(params[:id])

        render json: UserSerializer.new(u)
    end

    def update
        @u = User.find(params[:user][:id])
        @u.update(:id_img_path => params[:user][:id_img_path])
        @u.save(:validate => false)
        render json: UserSerializer.new(@u)
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :phone_number, :email, :password, :id_img_path)
    end


end
