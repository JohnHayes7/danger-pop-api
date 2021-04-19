class TattooRequestsController < ApplicationController

    def index
        trs = TattooRequest.all
        render json: TattooRequestsSerializer.new(trs)
    end

    def create
       
        @tr = TattooRequest.new(tattoo_request_params)
        if @tr.save
            render json: @tr
        else
            render json: @tr.errors.full_messages
        end
    end

    private

    def tattoo_request_params
        params.require(:tattoo_request).permit(:guest_email, :guest_full_name, :guest_phone, :description, :allergies, :body_location_image_path)
    end
end
