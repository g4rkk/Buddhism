Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :meditation_guides
  resources :meditation_sessions, only: [:create]
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'terms_of_service', to: 'pages#terms_of_service'
  get 'contact', to: 'pages#contact'

end
