class ItemsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_staff!
  def index
    @items = Item.page(params[:page]).per(5).order(id: "ASC")
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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "#{@item} の情報を更新しました。"
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "#{@item} を削除しました。"
    redirect_to items_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :price, :description, :stock, :image)
    end
    
end

