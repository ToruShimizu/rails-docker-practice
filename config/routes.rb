Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # localhost:3000にアクセスが来た場合のルーティングを意味する。
  # 以下の場合はBoardsControllerクラスのindexメソッドを実行するように定義されている
  root 'boards#index'
end
