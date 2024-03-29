class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:item_name].present?
      @items = Item.where("name LIKE ?", "%#{params[:item_name]}%")
    else
      @items = Item.page(params[:page])
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item was successfully created."
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      flash[:notice] = "Item was successfully updated."
      redirect_to admin_item_path(item)
    else
      redirect_to edit_admin_item_path(item)
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :is_sold_out, :item_image)
  end
end
