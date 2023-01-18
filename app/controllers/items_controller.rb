class ItemsController < ApplicationController
  def index
  end

  def new
    ＠item = Item.new
  end

  def create
    @item = Item.find(params[:id])
    @item = Item.new(item_params)
  end

  private
  def prototype_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :charge_id, :prefecture_id, :delivery_day_id, :cost, :image).merge(user_id: current_user.id)
  end

end
