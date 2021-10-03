class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :authenticate_staff!

  def after_sign_in_path_for(resource)
    case resource
    when User
      root_path
    when Staff
      staffs_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
