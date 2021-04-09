class ProjectsController < ApplicationController

    def index
        projs = Project.all
        render json: ProjectsSerializer.new(projs)
    end

    def create
        if params[:attributes][:accepted]
            
            # IF THERE IS A USER FIND THE USER
            # IF THERE IS NOT A USER CREATE A USER
            if !params[:attributes][:user]
                
                u = User.new()
                u.email = params[:attributes][:guest_email]
                u.name = ""
                u.phone_number = ""
                u.password = "pass"
                u.tattoo_approved = true
                u.save
            else
                u = User.find( params[:attributes][:user][:id])
                u.tattoo_approved = u.tattoo_approved || true
                
            end
        
            if u.save
                
                proj = Project.new()
                proj.tattoo_request_id = params[:id]
                proj.user_id = u.id
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
end
