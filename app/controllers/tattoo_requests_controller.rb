class TattooRequestsController < ApplicationController

    def index
        trs = TattooRequest.all
        render json: TattooRequestsSerializer.new(trs)
    end

    def create
        binding.pry
        @tr = TattooRequest.new(tattoo_request_params)

        if @tr.save
            render json: @tr
        else
            render json: @tr.errors.full_messages
        end
    end

    private

    def tattoo_request_params
        params.permit(:guest_email, :description, :image)
    end
end
