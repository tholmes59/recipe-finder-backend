Rails.application.routes.draw do
  post "/api/v1/login", to "api/v1/sessions#create"
  get "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user"
  delete "/api/v1/logout", to: "api/v1/sessions#destroy"

  namespace :api do
    namespace :v1 do
      resources :users
      resources :recipes
      resources :favorites
    end
  end
  
end
