Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :meditation_guides
  resources :meditation_sessions, only: [:create]
end
