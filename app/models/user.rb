class User < ApplicationRecord
    has_secure_password

    has_many :favorites
    has_many :recipes, through: :favorites

    validates :name, :username, :email, :password, :presense => true
    validates :username, :uniqueness => true

end
