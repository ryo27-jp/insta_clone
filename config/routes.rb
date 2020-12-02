Rails.application.routes.draw do
  root 'posts#index'

  resources :users, only: %i[new create]
<<<<<<< HEAD
  resources :posts

=======
>>>>>>> parent of 82bb807... post機能のルーティング作成
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
