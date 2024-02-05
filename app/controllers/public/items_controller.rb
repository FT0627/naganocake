class Public::ItemsController < ApplicationController
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
  end
end
