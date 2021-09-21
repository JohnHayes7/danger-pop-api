class UsersController < ApplicationController    
    def index
        users = User.all
        render json: UserSerializer.new(users)
    end

    def create
       
        @user = User.new(user_params)
        if @user.administrator
            @user.name = "Please Add your Name"
            @user.phone_number="Please add your Phone Number"
        end
        if @user.save
            payload = {user_id: @user.id}
            token = encode_token(payload)
            UserMailer.welcome_email(@user).deliver_now
            render json: {user: @user, jwt: token}
        else
            render json: {errors: user.errors.full_messages}, status: not_acceptable
        end
    end

    def show
        u = User.find(params[:id])

        render json: UserSerializer.new(u)
    end

    def update
        binding.pry
        @u = User.find(params[:user][:id])
        @u.update(:id_img_path => params[:user][:id_img_path])
        @u.save(:validate => false)
        render json: UserSerializer.new(@u)
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :phone_number, :email, :password, :id_img_path, :administrator, :account_creation_method, :inital_login)
    end


end
