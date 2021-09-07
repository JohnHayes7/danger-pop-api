class UserMailer < ApplicationMailer
    default from: 'WarwickCreativeServices@gmail.com'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: "Welcome to Danger Pop!")
    end

    def forgot_password(user)
        @user = user
        binding.pry
        mail(to: @user.email, subject: "Danger Pop Password Reset")
    end

end
