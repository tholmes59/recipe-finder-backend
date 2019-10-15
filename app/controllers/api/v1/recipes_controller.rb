class Api::V1::RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :update, :destroy]

    def index
        @recipes = Recipe.all 

        render json: @recipes 
    end

    def show
        render json: @recipe 
    end

    def create

    end


    def update

    end

    def destroy
        @recipe.destroy
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:title, :recipe_identifier)
    end

end
