class ItemsController < ApplicationController
  before_action :move_to_loguin, except: [:index, :show]
  before_action :set_tweet, only: [:edit, :show]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  # ストロングパラメーターを定義
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  # 未ログインのユーザーをログインページへ遷移
  def move_to_loguin
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_tweet
    @item = Item.find(params[:id])
  end
end
