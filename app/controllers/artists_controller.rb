class ArtistsController < ApplicationController

    def index
        artists = Artist.all
        render json: ArtistsSerializer.new(artists)    
    end

    def create
        artist = Artist.new(artist_params)
        if artist.save
            render json ArtistsSerializer(artist)
        else
            render json: {code: 2020, message: "Could Not Create Artist Account.  Please confirm your information"}
        end
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :phone_number, :email, :password)
    end

end

