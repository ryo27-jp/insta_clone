Rails.application.routes.draw do
  root 'posts#index'

  resources :users, only: %i[new create]
  resources :posts do
    # コレクションだけを親のスコープの下で生成。メンバーはネストに含めない。
    resources :comments, shallow: true
  end
  # コレクション(index/new/createのような、idを持たないアクション)
  # メンバー(show/edit/update/destroyのような、idを必要とするアクション)
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
