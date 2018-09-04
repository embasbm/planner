Rails.application.routes.draw do
  constraints subdomain: 'api' do
    api_version(module: 'V1', path: { value: 'v1' }) do
      resources :cities, only: [:create, :show] do
        get :recommend, on: :collection
      end
    end
  end
end
