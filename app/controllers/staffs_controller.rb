class StaffsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end
end