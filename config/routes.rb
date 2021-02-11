Rails.application.routes.draw do
  root 'posts#index'

  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
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
    resource :account
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
