class TattooRequestsController < ApplicationController

    def index
        trs = TattooRequest.all
        render json: TattooRequestsSerializer.new(trs)
    end

    def create
       
        @tr = TattooRequest.new(tattoo_request_params)
        # binding.pry
        if @tr.save
            TattoorequestsentMailer.confirmation_email(@tr).deliver_now
            ShopMailer.tr_notice(@tr).deliver_now
            render json: @tr
        else
            render json: @tr.errors.full_messages
        end
    end

    def update
        puts `tr_params: #{tattoo_request_params}`
        puts `params: #{params}`
        tr = TattooRequest.find(params[:id])
        puts `tattoo_request: #{tr}`
        # puts `params: #{params}`
        # !!params[:mockupimagelocation] ? tr.mockupImageLocation = params[:mockupimagelocation] : tr.mockupImageLocation
        # !!params[:attributes][:backup] ? tr.backup_project = params[:attributes][:backup]  : tr.backup_project
        # puts `#{tr}`
        # tr.save(:validate => false)
        # render json: TattooRequestsSerializer.new(tr)
        render json: tr
    end




    private

    def tattoo_request_params
        params.require(:tattoo_request).permit(:guest_email, :guest_full_name, :guest_phone, :description, :allergies, :body_location_image_path)
    end
end
