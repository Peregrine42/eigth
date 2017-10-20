Rails.application.routes.draw do
  root "welcome#index"
  resources :welcome, controller: :welcome, only: [:index]
  resources :session, controller: :session, only: [:create, :new, :index, :destroy]
  resources :users
end
