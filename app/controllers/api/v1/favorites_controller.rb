class Api::V1::FavoritesController < ApplicationController
    before_action :set_favorite, only: [:show, :update, :destroy]

    def index
        if logged_in?
            @favorites = current_user.favorites
            render json: FavoritesSerializer.new(@favorites)
        else
            render json: { error: "Please log in to see your favorites"}
        end
    end

    def show
        render json: FavoritesSerializer.new(@favorite)
    end

    def create
        @favorite = Favorite.new(favorite_params)
        if @favorite.save 
            render json: @favorite, status: :created
        else
            render json: @favorite.errors, status: :unprocessable_entity
        end
    end

    def update
        if @favorite.update(favorite_params)
            render json: @favorite
        else
            render json: @favorite.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @favorite.destroy
            render json: { data: "Removed from Favorites" }, status: :ok
        else
            render json: { data: "Favorite not found" }, status: :unprocessable_entity
        end
    end

    private

    def set_favorite
        @favorite = Favorite.find(params[:id])
    end

    def favorite_params
        params.require(:favorite).permit(:user_id, :recipe_id)
    end
end
