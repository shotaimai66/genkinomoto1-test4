class CartsController < ApplicationController
  #skip_before_action :authenticate_user!
  skip_before_action :authenticate_staff!
  
  def show
    @orders = Order.all
    
  end


end
