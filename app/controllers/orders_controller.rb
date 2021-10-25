class OrdersController < ApplicationController
  #skip_before_action :authenticate_user!
  skip_before_action :authenticate_staff!

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

  # カートが無い場合はカートを作成
  # User has_one Cart なので ".build_cart"を使う
  def create
    if !current_user.cart.present?
      cart = current_user.build_cart
      cart.save
    else
      cart = current_user.cart
    end
    order = cart.orders.build(order_params)
    order.item = Item.find(params[:item][:item_id])
    order.save
  end

  def destroy
    @order = Order.find(params[:format])
    @order.destroy
    flash[:success] = "#{@order} を削除しました。"
    redirect_to carts_path
  end

  private
    def order_params
      params.permit(:quantity, :item_id, :sub_total, :shipping_fee, :handling_fee, :tax, :grand_total)
    end

end
