class ItemsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_staff!
  def index
    @items = Item.all
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
    redirect_to items_path
    else
      flash[:danger] = "#{@item} の作成に問題がありました"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    
  end

  private
    def item_params
      params.require(:item).permit(:name, :price, :description, :stock)
    end
    
end

