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
        @recipe = Recipe.find_by(recipe_title: params[:title])

        if @recipe 
            params[:user_id] = current_user.id
            params[:recipe_id] = @recipe.id
            @favorite = Favorite.find_by(user_id: params[:user_id], recipe_id: params[:recipe_id])

            if @favorite
                render json: { error: "Already added to favorites!"}
            else
                @favorite = Favorite.create(:user_id => params[:user_id], :recipe_id => params[:recipe_id])
                render json: @favorite, status: :created
            end
        else
            @recipe = Recipe.new(recipe_params)
            if @recipe.save
                params[:user_id] = current_user.id 
                params[:recipe_id] = @recipe.id 
                @favorite = Favorite.create(:user_id => params[:user_id], :recipe_id => params[:recipe_id])
                render json: :created
            else
                render json: @recipe.errors, status: :unprocessable_entity
            end
        end
    end


    def update
        if @recipe.update(recipe_params)
            render json: @recipe
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @recipe.destroy
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:recipe_title, :recipe_identifier, :recipe_image)
    end

end
