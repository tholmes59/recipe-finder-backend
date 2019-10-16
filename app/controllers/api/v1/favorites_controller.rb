class Api::V1::FavoritesController < ApplicationController

    def index
        if logged_in?
            @favorites = current_user.favorites
            render json: FavoritesSerializer.new(@favorites)
        else
            render json: { error: "Please log in to see your favorites"}
        end
    end

    def show
        
    end

    def create

    end

    def update

    end

    def destroy
        @favorite.destroy
    end


end
