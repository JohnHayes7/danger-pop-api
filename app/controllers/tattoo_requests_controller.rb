class TattooRequestsController < ApplicationController

    def index
        trs = TattooRequest.all
        render json: TattooRequestsSerializer.new(trs)
    end

    def create
       
        @tr = TattooRequest.new(tattoo_request_params)
        if @tr.save
            TattoorequestsentMailer.confirmation_email(@tr).deliver_now
            ShopMailer.tr_notice(@tr).deliver_now
            render json: @tr
        else
            render json: @tr.errors.full_messages
        end
    end

    def update
        tr = TattooRequest.find(params[:id])
        # WHAT HAPPENS IF I DECLINE A BACKUP PROJECT
        !!params[:tattoo_request][:mockupimagelocation] ? tr.mockupImageLocation = params[:tattoo_request][:mockupimagelocation] :tr.mockupImageLocation = tr.mockupImageLocation
        !!params[:tattoo_request][:backup] ? tr.backup_project = params[:tattoo_request][:backup] : tr.backup_project = tr.backup_project
        # !!params[:tattoo_request][:declined] ? tr.declined = params[:tattoo_request][:declined] : tr.declined = tr.declined
        if params[:tattoo_request][:declined]
            tr.declined = params[:tattoo_request][:declined]
            
            tr.declined_reason = params[:tattoo_request][:reason]
            tr.save
            
            TattoorequestsentMailer.declined_email(tr).deliver_now
        end
        tr.save(:validate => false)
        render json: TattooRequestsSerializer.new(tr)
    end




    private

    def tattoo_request_params
        params.require(:tattoo_request).permit(:guest_email, :guest_full_name, :guest_phone, :description, :allergies, :body_location_image_path)
    end
end
