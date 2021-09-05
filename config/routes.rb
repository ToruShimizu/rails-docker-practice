Rails.application.routes.draw do
  # mypageにアクセスされた時はusersのmeアクションが呼ばれる
  get 'mypage', to: 'users#me'
  # ログインというURLで行う
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'users/new'

  get 'users/create'

  get 'users/me'

  get 'form/index'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users, only: %i[new create]
  resources :boards
  resources :comments, only: %i[create, destroy]
end