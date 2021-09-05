class UsersController < ApplicationController
  def new
    # 新しいユーザーを登録するだけ
    @user = User.new(flash([:user]))
  end

  def create
    # フォームに送信された新しいparamsから新しいユーザーオブジェクトを作成
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      redirect_to :back, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def me
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
