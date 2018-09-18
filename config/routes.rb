Rails.application.routes.draw do
  apipie

  namespace :api do
    namespace :v1 do
      resources :taxes, only: %i[create index]
    end
  end
end
