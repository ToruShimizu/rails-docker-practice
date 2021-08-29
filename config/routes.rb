Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # localhost:3000にアクセスが来た場合のルーティングを意味する。
  # 以下の場合はBoardsControllerクラスのindexメソッドを実行するように定義されている
  # GETメソッドで/boardsにリクエストが来た場合にBoardsControllerのindexアクションが呼ばれるように定義
  get 'boards', to: 'boards#index'
  # GETメソッドで/boards/newにリクエストが来た場合、BoardsControllerのnewアクションが呼ばれるように定義
  get 'boards/new', to: 'boards#new'
end
