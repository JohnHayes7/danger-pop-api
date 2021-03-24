class ProjectsController < ApplicationController

    def index
        projs = Project.all
        render json: ProjectsSerializer.new(projs)
    end
end
