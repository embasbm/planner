Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cities, only: [:create, :show] do
        get :recommend, on: :collection
      end
    end
  end
end
