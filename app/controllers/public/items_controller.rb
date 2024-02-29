class Public::ItemsController < ApplicationController
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def index
    @genres = Genre.all
    if params[:item_name].present?
      @items = Item.where("name LIKE ?", "%#{params[:item_name]}%")
    elsif params[:genre_id].present?
      @genre_id = params[:genre_id]
      @items = Item.where(genre_id: @genre_id)
      @genre = Genre.find(params[:genre_id])
    else
      @items = Item.page(params[:page])
    end
  end
  
  
end
