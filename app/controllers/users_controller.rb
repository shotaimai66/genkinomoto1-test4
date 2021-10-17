class UsersController < ApplicationController
  skip_before_action :authenticate_staff!

  def index
    @users = User.where(id: current_user.id)
  end

  def show

  end

  def new

  end

  def edit

  end
end
