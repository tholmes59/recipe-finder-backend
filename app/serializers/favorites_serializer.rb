class FavoritesSerializer
    include FastJsonapi::ObjectSerializer

    attribute :title do |object|
        object.recipe.title 
    end
end
