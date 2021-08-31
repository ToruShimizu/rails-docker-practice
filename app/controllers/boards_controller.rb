#  コントローラーを定義する際は基本的にApplicationControllerクラスを継承する
class BoardsController < ApplicationController
  # indexメソッド
  # rootに定義したメソッドのことをアクションという
  # BoardsControllerのindexアクションとも呼ばれる
  def index
    @boards = Board.all
  end

  def new
    # Boardモデルのオブジェクトを作成して@boardというインスタンス変数に代入
    # インスタンス変数はビューでも参照できる
    @board = Board.new
  end

  def create
    Board.create(board_params)
  end

  def show
    @board = Board.find(params[:id])
  end

  private

  # paramsメソッドの中のboardキーの中のname title bodyのキーを取得できる
  def board_params
  # model名のキーとモデルのプロパティのキー
    params.require(:board).permit(:name, :title, :body)
  end
end
