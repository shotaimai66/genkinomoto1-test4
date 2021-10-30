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
    user = current_user
    if user.update(flag: true, exit_date: Time.now)
      reset_session # データをリセットする
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
    end
  end
end
