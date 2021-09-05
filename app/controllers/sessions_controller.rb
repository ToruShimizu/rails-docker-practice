class SessionsController < ApplicationController
  def create
    # 引数に指定した条件とマッチするユーザーを一件取得する
    # 該当しない場合はnilが返ってくる
    user = User.find_by(name: params[:session][:name])
    # ユーザーがnilではなく、パスワードがマッチして認証が成功している
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      render 'home/index'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
