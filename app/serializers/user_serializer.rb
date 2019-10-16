class UserSerializer
    include FastJsonapi::ObjectSerializer
    
    attributes :username, :name, :email

    has_many :favorites, serializer: FavoritesSerializer

    attribute :favorites do |object|
      FavoritesSerializer.new(object.favorites).as_json["data"]
    end
    
  end