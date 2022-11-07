class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, :user_id)
  end
end
