class ArtistsController < ApplicationController

    def index
        artists = Artist.all
        render json: ArtistsSerializer.new(artists)    
    end

end
