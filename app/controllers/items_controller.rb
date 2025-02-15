class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  # deviseのヘルパーメソッド。ログインしていなければ、ログイン画面へ遷移させる。
  def index
    @items = Item.all.order('created_at DESC')
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
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id,
                                 :shipping_day_id, :image, :price).merge(user_id: current_user.id)
  end
end
