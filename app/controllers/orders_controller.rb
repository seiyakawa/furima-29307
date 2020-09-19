class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:id])
    # 商品情報を引き継げるか？
  end  

  def create
    @address = Address.create(address_params)
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :prefecture_id, :city, :address, :phone_number)
    # ユーザーIDと商品IDも保存できるか？
  end
end