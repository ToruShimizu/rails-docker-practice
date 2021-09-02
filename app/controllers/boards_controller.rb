#  コントローラーを定義する際は基本的にApplicationControllerクラスを継承する
class BoardsController < ApplicationController
  # 呼び出し前に実行される。引数に実行したいメソッドを引数に書く
  # %記号でシンボルの配列を定義
  before_action :set_target_board, only: %i[show edit update destroy]
  # indexメソッド
  # rootに定義したメソッドのことをアクションという
  # BoardsControllerのindexアクションとも呼ばれる
  # ビューで使う
  # @boardはインスタンス変数
  # boardはローカル変数
  def index
    @boards = Board.page(params[:page])
  end

  def new
    # Boardモデルのオブジェクトを作成して@boardというインスタンス変数に代入
    # インスタンス変数はビューでも参照できる
    @board = Board.new
  end

  def create
    # boardのインスタンス引数のパラメータで初期化する
    board = Board.new(board_params)
    if board.save
      # flashの任意のキーに値を設定しておくことで、次に値が参照されるまで保存される
    flash[:notice] = `「#{board.title}」の掲示板を作成しました`
    # 正常に作成されると作成されたオブジェクトが返ってくる
    # 対応するidのページに遷移
    redirect_to board
    else
      # full_messagesでエラー箇所がわかる
      redirect_to new_board_path, flash: {board: board, error_messages: board.errors.full_messages}
    end
  end

  def show
  end

  def edit
  end

  def update
    @board.update(board_params)

    redirect_to @board
  end

  def destroy
    @board.delete
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました。"}

  end

  private

  # paramsメソッドの中のboardキーの中のname title bodyのキーを取得できる
  def board_params
  # model名のキーとモデルのプロパティのキー
    params.require(:board).permit(:name, :title, :body)
  end

  def set_target_board
    @board = Board.find(params[:id])
  end
end
