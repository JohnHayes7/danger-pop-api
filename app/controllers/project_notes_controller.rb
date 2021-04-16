class ProjectNotesController < ApplicationController 
    
    def create
        pn = ProjectNote.new()
        pn.project_id = params[:project_id]
        pn.content = params[:content]
        pn.save
        
    end

    def destroy
        pn = ProjectNote.find(params[:id])
        pn.delete
    end
end
