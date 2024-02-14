class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def confirm_order
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
        
    else
    
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name )  
  end
end
