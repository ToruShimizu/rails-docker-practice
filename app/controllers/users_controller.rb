class UsersController < ApplicationController
  def new
    # 新しいユーザーを登録するだけ
    @user = User.new
  end

  def create
  end

  def me
  end
end
