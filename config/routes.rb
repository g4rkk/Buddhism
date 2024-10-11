# config/routes.rb
Rails.application.routes.draw do
  # 用户认证路由
  devise_for :users

  # 根路由
  root to: "home#index"

  # 用户资源路由
  resources :users

  # 冥想指南和会话路由
  resources :meditation_guides
  resources :meditation_sessions, only: [:create]

  # 静态页面路由
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'terms_of_service', to: 'pages#terms_of_service'
  get 'contact', to: 'pages#contact'

  # 书籍相关路由
  resources :books, only: [:index, :show, :new, :create] do
    member do
      post 'toggle_bookmark'
    end
  end

  # 书签路由
  resources :bookmarks, only: [:index]
end