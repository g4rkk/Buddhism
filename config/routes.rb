Rails.application.routes.draw do
  # 用户认证路由
  devise_for :users

  # 根路由
  root to: "home#index"

  # 用户资源路由 (只显示用户的 show 页面)
  resources :users, only: [:show]

  # 冥想指南路由
  resources :meditation_guides

  # 冥想会话路由 (如果只允许创建会话，保持 :create)
  resources :meditation_sessions, only: [:new, :create]

  # 静态页面路由
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'terms_of_service', to: 'pages#terms_of_service'
  get 'contact', to: 'pages#contact'

  # 书籍相关路由 (包括书籍列表、查看、创建、书签功能)
  resources :books do
    member do
      post :toggle_bookmark
    end
    collection do
      get :bookmarks
      get :my_books
    end
  end
end
