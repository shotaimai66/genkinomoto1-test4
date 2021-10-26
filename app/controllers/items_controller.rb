class ItemsController < ApplicationController
  #skip_before_action :authenticate_user!
  skip_before_action :authenticate_staff!
  before_action :set_q, only: [:index, :search]

  def index
    # @items = Item.page(params[:page]).per(5).order(id: "ASC")
    @items = @q.result.page(params[:page]).per(5).order(id: "DESC")
  end

  def search
    @results = @q.result
  end

  def show
    @item = Item.find(params[:id])
    
  end

  def new
    @item = Item.new
    
  end

  def create
    
    if @item = Item.create(item_params)
      flash[:success] = "#{@item} の登録に成功しました"
    redirect_to items_path(current_user)
    else
      flash[:danger] = "#{@item} の作成に問題がありました"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "#{@item.name} の情報を更新しました。"
      redirect_to items_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "#{@item.name} を削除しました。"
    redirect_to items_path(current_user)
  end

  # 以下、決済機能を試験的に導入
  def pay
    item = Item.find(params[:format]) # to identify item by params[:format]
    quantity = params[:item][:quantity].to_i
    amount = item.price*quantity

    Payjp.api_key = ENV["PAYJP_TEST_SECRET_KEY"]
    charge = Payjp::Charge.create(
    amount: amount,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end
  # 試験的決済機能ここまで

  private
    def item_params
      params.require(:item).permit(:name, :price, :description, :stock, :image)
    end

    def set_q
      @q = Item.ransack(params[:q])
    end
    
end

