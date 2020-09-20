class OrdersController < ApplicationController
  # 購入画面に行きたいユーザーがログインしていなければ、ログイン画面へ遷移させる
  before_action :move_to_top_page

  def index
    authenticate_user!
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    # ordersテーブルとaddressesテーブルへ同時に生成
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      # @order = OrderAddress.new
      render :index
    end
  end

  private
  # カード情報のみ受け取りを許可
  def order_params
    params.require(:order_address).permit(:token, :post_code, :prefecture_id, :city, :address, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # 支払情報を生成するオブジェクト
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_top_page
    @item = Item.find(params[:item_id])
    if user_signed_in? != true
      redirect_to new_user_session_path
    elsif @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end
end