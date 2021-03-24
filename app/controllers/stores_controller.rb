class StoresController < ApplicationController

    def index
        stores = Store.all
        render json: StoresSerializer.new(stores)
    end
end
