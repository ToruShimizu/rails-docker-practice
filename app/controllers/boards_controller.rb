#  コントローラーを定義する際は基本的にApplicationControllerクラスを継承する
class BoardsController < ApplicationController
  # indexメソッド
  # rootに定義したメソッドのことをアクションという
  # BoardsControllerのindexアクションとも呼ばれる
  # ビューで使う
  # @boardはインスタンス変数
  # boardはローカル変数
  def index
    @boards = Board.all
  end

  def new
    # Boardモデルのオブジェクトを作成して@boardというインスタンス変数に代入
    # インスタンス変数はビューでも参照できる
    @board = Board.new
  end

  def create
    board = Board.create(board_params)
    # 正常に作成されると作成されたオブジェクトが返ってくる
    # 対応するidのページに遷移
    redirect_to board
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    board = Board.find(params[:id])
    board.update(board_params)

    redirect_to board
  end

  def destroy
    board = Board.find(params[:id])
    board.delete

    redirect_to board
  end

  private

  # paramsメソッドの中のboardキーの中のname title bodyのキーを取得できる
  def board_params
  # model名のキーとモデルのプロパティのキー
    params.require(:board).permit(:name, :title, :body)
  end
end
