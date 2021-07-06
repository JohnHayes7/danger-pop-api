class PasswordsController < ApplicationController

    def forgot
        if params[:email].blank? 
            render json: {error: 'Email not present'}
        end

        user = User.find_by(email: params[:email]) # if present find user by email

        if user.present?
            user.generate_password_token! #generate pass token
            # SEND EMAIL HERE
            render json: {status: 'ok'}, status: :ok
        else
            render json: {error: [’Email address not found. Please check and try again.’]}, status: :not_found
        end
    end
end
