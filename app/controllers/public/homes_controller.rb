class Public::HomesController < ApplicationController
  def about
    
  end
  
  def top
    @genres = Genre.all
    @items = Item.order(created_at: :desc).limit(4)
  end
end
