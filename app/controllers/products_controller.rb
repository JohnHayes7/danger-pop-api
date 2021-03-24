class ProductsController < ApplicationController

    def index
        prods = Product.all
        render json: ProductsSerializer.new(prods)
    end
end
