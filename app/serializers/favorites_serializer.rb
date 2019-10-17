class FavoritesSerializer
    include FastJsonapi::ObjectSerializer

    attribute :recipe_title do |object|
        object.recipe.recipe_title 
    end

    attribute :recipe_identifier do |object|
        object.recipe.recipe_identifier
    end
end
