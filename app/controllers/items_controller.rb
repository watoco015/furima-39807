class ItemsController < ApplicationController
  def index
    @items = Item.all 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :user, :item_name, :category_id, :note, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
