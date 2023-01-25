class OrdersController < ApplicationController


  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
      if @item.order.present? || current_user == @item.user || unless user_signed_in?
        redirect_to root_path 
        end
      end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address= OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = "sk_test_7287bd2220ae650a7927610f"  
      Payjp::Charge.create(
        amount: @item.cost,  # 商品の値段
        card: order_params[:token],   # カードトークン
        currency: 'jpy'                # 通貨の種類（日本円）
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def order_params
      params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number, :order_id).merge(token:params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

end
