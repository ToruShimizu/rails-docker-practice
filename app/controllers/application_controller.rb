class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  beefore_action :current_user

  private

  def current_user
    # セッションにユーザIDの情報がなければ処理から抜ける、@userのインスタンス変数はnilになる
    return unless session[:user_id]
    # ログイン中のユーザーが代入される  
    @current_user = User.find_by(id: session[:user_id])
  end
end
