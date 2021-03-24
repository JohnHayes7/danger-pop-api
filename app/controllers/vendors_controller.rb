class VendorsController < ApplicationController

    def index 
        vendors = Vendor.all
        render json: VendorsSerializer.new(vendors)
    end
end
