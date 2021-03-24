class CartsController < ApplicationController

    def index
        carts = Cart.all
        render json: CartSerializer.new(carts)
    end
end
