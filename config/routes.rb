Rails.application.routes.draw do
  root "static_pages#home"
  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  get "/forget_password",   to: "password_resets#new"
  post "/forget_password",   to: "password_resets#create"
  resources :password_resets,     only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
