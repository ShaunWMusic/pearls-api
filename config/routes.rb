Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "status#index"
  post "/session", to: "session#create"
  get "/users/me", to: "users#show_current"

  jsonapi_resources :contacts
  jsonapi_resources :barbershop_inventories
  jsonapi_resources :users
end
