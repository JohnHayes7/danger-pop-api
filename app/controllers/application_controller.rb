# require remote_pry
class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token

    helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!

    def login!
        session[:user_id] = @user.id
        puts "login_session: #{session[:user_id]}"
    end

    def logged_in?
        puts "logged_in_session: #{session[:user_id]}"
        !!session[:user_id]
    end

    def current_user
        puts "current_user_session: #{session[:user_id]}"
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorized_user?
        @user == current_user
    end

    def logout!
        session.clear
    end
    




   
end
