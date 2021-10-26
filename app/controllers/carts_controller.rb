class CartsController < ApplicationController
  #skip_before_action :authenticate_user!
  skip_before_action :authenticate_staff!
  
  def show
    @orders = Order.all
    @subtotal = 0
    # @sumに合計金額を代入する
    @orders.each do |order|
      @subtotal += order.item.price*order.quantity
    end
    @tax = (@subtotal*0.10).round
    # 5000円以上のお買い上げで送料無料
    if @subtotal >= 5000 || @subtotal == 0
      @shipping_fee = 0
    else
      @shipping_fee = 500
    end
    @total = @subtotal+@tax+@shipping_fee
  end

  def pay
    item = Item.find(params[:format]) # to identify item by params[:format]
    quantity = params[:item][:count].to_i
    amount = item.price*quantity

    Payjp.api_key = ENV["PAYJP_TEST_SECRET_KEY"]
    charge = Payjp::Charge.create(
    amount: amount,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end



end
