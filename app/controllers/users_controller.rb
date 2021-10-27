class UsersController < ApplicationController
  skip_before_action :authenticate_staff!

  def index
    @users = User.where(id: current_user.id)
  end

  def show
  end

  def edit
  end

  def update
  end

  def out
    user = current_user # 情報を入れる
    user.update(flag: true) # flagをtrueへ
    reset_session # データをリセットする
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path # トップ画面へ
  end
end
