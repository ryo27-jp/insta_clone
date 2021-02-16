# sidekiqの管理画面用にルーティングを設定
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'posts#index'

  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  resources :activities, only: [] do
    patch :read, on: :member
  end
  resources :users, only: %i[index show new create]
  resources :posts do
    # コレクションだけを親のスコープの下で生成。メンバーはネストに含めない。
    resources :comments, shallow: true
    # コレクションルーティング
    get :search, on: :collection
  end
  # コレクション(index/new/createのような、idを持たないアクション)
  # メンバー(show/edit/update/destroyのような、idを必要とするアクション)

  namespace :mypage do
    # 今回は１つのリソースしか扱わない想定なので単数系（idを用いない)
    resource :account, only: %i[edit update]
    resources :activities, only: %i[index]
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
