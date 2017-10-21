Rails.application.routes.draw do
  root "welcome#index"
  resources :welcome, controller: :welcome, only: [:index]
  resource :session, controller: :session, only: [:create, :new, :show, :destroy]
  resources :users
end
