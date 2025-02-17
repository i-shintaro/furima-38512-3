class ItemsController < ApplicationController
  # deviseのヘルパーメソッド。ログインしていなければ、ログイン画面へ遷移させる。
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # すでに保存されたデータを取り出す記述
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # ログインしているユーザーと@itemのユーザーの一致確認, 異なる場合はトップページへ遷移させる
  before_action :move_to_index, only: [:edit, :update, :destroy]

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
    # @item = Item.find(params[:id])
  end

  def edit
    # @item = Item.find(params[:id])
  end

  def update
    # @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id,
                                 :shipping_day_id, :image, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # 出品者でなければトップページに遷移させています。これにより、出品者のみ編集ができる状態を作れています
  # 今ログインしているユーザー と@itemオブジェクトに関連付けられているユーザーが異なる場合にtrue（ !=「等しくない」）
  def move_to_index
    redirect_to root_path if current_user.id != @item.user.id
  end
end
