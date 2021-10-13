class CardsController < ApplicationController
    def index
        # add query args for filtering
        # @cards = Card.all()
        render json: {route: "Show Card Index"}
    end
    
    def show
        render json: {route: "Show Card #{params[:id]}"}
    end
end
