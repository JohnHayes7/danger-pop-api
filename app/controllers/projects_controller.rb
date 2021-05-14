class ProjectsController < ApplicationController

    def index
        projs = Project.all
        render json: ProjectsSerializer.new(projs)
    end

    def create
        @tr = TattooRequest.find(params[:id])
        if params[:attributes][:accepted]
            # binding.pry
            # IF THERE IS A USER FIND THE USER
            # IF THERE IS NOT A USER CREATE A USER
            if !params[:attributes][:user]
                @u = User.find_by(email: params[:attributes][:guest_email])
                # binding.pry
                if !@u

                    @u = User.new()
                    @u.email = params[:attributes][:guest_email]
                    @u.name = params[:attributes][:guest_full_name]
                    @u.phone_number = params[:attributes][:guest_phone]
                    # NEED TO ASSIGN RANDOM GENTERATED PASS
                    @u.password = "pass"
                    @u.tattoo_requests.push(@tr)
                    @u.tattoo_approved = true
                    @u.administrator = false
                    @u.allergies = params[:attributes][:allergies]
                    @u.save
                else
                    @u.tattoo_requests.push(@tr)
                    @u.tattoo_approved = @u.tattoo_approved || true 
                    @u.administrator = false
                    @u.allergies = params[:attributes][:allergies]
                    @u.save
                end
            else
                @u = User.find(params[:attributes][:user][:id])
                # binding.pry
                @u.tattoo_requests.push(@tr)
                @u.tattoo_approved = @u.tattoo_approved || true
                @u.administrator = false
                @u.allergies = params[:attributes][:allergies]
                @u.save
                
            end
        
            if @u.save
                @tr.accepted = true
                @tr.save
                
                proj = Project.new()
                
                proj.tattoo_request_id = params[:id]
                proj.user_id = @u.id
                proj.save
                proj.title = @u.name_combine +"_"+"#{proj.id}"
                proj.save
                if proj.save
                    render json: ProjectsSerializer.new(proj)
                else
                    render json: {code: 3000, message:"There was a problem creating this project"}
                end
            end 
        else
            render json: {code:3330, message:"This is not an approved request.  Please contact system administrator if you have approved this request"}
        end
       
    end


    def show
        proj = Project.find(params[:id])
        render json: ProjectsSerializer.new(proj)
    end



    def update
        proj = Project.find (params[:id])
        if params[:title]
            proj.title = params[:title]
        end
        
        if params[:progressimagelocation]
            
            proj.progress_images << params[:progressimagelocation]
        end
        if params[:finalimagelocation]
            
            proj.final_images << params[:finalimagelocation]
        end
       proj.save
       render json: ProjectsSerializer.new(proj)
    end
end
