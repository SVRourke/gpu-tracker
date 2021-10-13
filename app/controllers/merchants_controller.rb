class MerchantsController < ApplicationController
    def index
        # @merchants = Merchant.all()
        render json: {route: "merchant's index"}
    end
    
    def show
        # @merchant = Merchant.find(params[:id])
        render json: {route: "show merchant #{params[:id]}"}
    end
end
