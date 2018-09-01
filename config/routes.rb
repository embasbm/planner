Rails.application.routes.draw do
  constraints subdomain: 'api'
    api_version(module: 'V1', path: { value: 'v1' }) do
    end
  do
end
