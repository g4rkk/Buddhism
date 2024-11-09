Rails.application.routes.draw do
  get 'nearby_users/index'
  get 'buddhist_sites/index'
  # 用户认证路由，指定 omniauth_callbacks 控制器
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # 根路由
  root to: "home#index"

  # 用户资源路由 (只显示用户的 show 页面)
  resources :users, only: [:show]

  # プロフィール编辑和更新路由
  get 'profile/edit', to: 'users#edit_profile', as: 'edit_profile'
  patch 'profile/update', to: 'users#update_profile', as: 'update_profile'

  # 冥想指南路由，使用 slug 作为参数
  resources :meditation_guides, param: :slug, only: [:index, :show, :new, :create]

  # 冥想会话路由
  resources :meditation_sessions, only: [:new, :create]

  # 静态页面路由
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'terms_of_service', to: 'pages#terms_of_service'
  get 'contact', to: 'pages#contact'

  # 书籍相关路由
  resources :books do
    member do
      post :toggle_bookmark
    end
    collection do
      get :bookmarks
      get :my_books
    end
  end

  # API 命名空间，用于仏教仲間探し和佛教场所功能
  namespace :api do
    # 仏教仲間探し功能路由 - 显示附近的仏教仲間
    get 'users/nearby', to: 'users#nearby', as: 'nearby_users'
    
    # 日本国内の仏教参拝マップ功能路由 - 显示佛教场所
    resources :buddhist_sites, only: [:index, :show]
  end

  # 用户界面路由
    get 'buddhist_sites', to: 'buddhist_sites#index', as: 'buddhist_sites'
    get 'nearby_users', to: 'nearby_users#index', as: 'nearby_users'

  # config/routes.rb
  resources :buddhist_sites do
    member do
      post :tag_site
    end
    collection do
      get :fetch_buddhist_sites
    end
  end
end
