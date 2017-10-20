Rails.application.routes.draw do
  root "welcome#index"
  resources :session, controller: :session, only: [:create, :new, :index, :destroy]
  resources :users
end
