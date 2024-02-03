class Public::ItemsController < ApplicationController
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
  
  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
  end
end
