class ProjectsController < ApplicationController

    def index
        projs = Project.all
        render json: ProjectsSerializer.new(projs)
    end

    def create
        
        @tr = TattooRequest.find(params[:id])
       
        if params[:attributes][:accepted]
           
            if !params[:attributes][:user]
                @u = User.find_by(email: params[:attributes][:guest_email])
               
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
                
                @u.tattoo_requests.push(@tr)
                @u.tattoo_approved = @u.tattoo_approved || true
                @u.administrator = false
                @u.allergies = params[:attributes][:allergies]
                @u.save(:validate => false)
                
            end
        
            if @u.save(:validate => false)
                @tr.accepted = true
                @tr.backup_project = false
                @tr.save
                
                proj = Project.new()
                
                proj.tattoo_request_id = params[:id]
                proj.user_id = @u.id
                
                # THIS WONT WORK...NO ID CREATED YET
                proj.title = "#{@u.name_combine}_#{proj.id}"
               
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

        if params[:completed_status] 
            proj.project_complete_status = params[:completed_status]
        elsif params[:completed_status] == false
            proj.project_complete_status = params[:completed_status]
        else
            proj.project_complete_status = proj.project_complete_status
        end

        if params[:deposit_received]
            proj.deposit_received_status = params[:deposit_received]
        elsif params[:deposit_received] == false
            proj.deposit_received_status = params[:deposit_received]
        else
            proj.deposit_received_status = proj.deposit_received_status
        end

        # binding.pry

       proj.save
       render json: ProjectsSerializer.new(proj)
    end
end
