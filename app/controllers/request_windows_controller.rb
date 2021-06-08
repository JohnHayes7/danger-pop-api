class RequestWindowsController < ApplicationController


    def show
        window = RequestWindow.find(params[:id])
        render json: window

    end

    def update
        window = RequestWindow.find(params[:id])
        window.openState = params[:open]
        window.save
        render json: window
    end

end
