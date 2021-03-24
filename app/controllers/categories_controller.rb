class CategoriesController < ApplicationController

    def index
        categories = Category.all 
        render json: CategoriesSerializer.new(categories)
    end

end
