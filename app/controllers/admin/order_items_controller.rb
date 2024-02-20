class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(order_item_params)
    if @order.order_items.status.all == "production_compleated"
      @order.update(status: "ready_to_ship")
    end
    redirect_to admin_order_path(@order)
  end
  
  private
  
  def order_item_params
    params.require(:order_item).permit(:status)
  end

end
