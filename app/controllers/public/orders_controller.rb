class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :order_item_exist?, only: [:confirm_order]

  def new
    @order = Order.new
  end

  def confirm_order
    @order = Order.new(order_params)
    if params[:order][:select_address] == "1"
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "2"
     @address = Address.find(params[:order][:address_id])
     @order.postal_code = @address.postal_code
     @order.address = @address.address
     @order.name = @address.name
    elsif params[:order][:select_address] == "3"
    end
      @cart_items = current_customer.cart_items
      @order.customer_id = current_customer.id
  end

  def create
    @order = Order.new(order_params)
    @order.save

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_items = OrderItem.new
      @order_items.order_id = @order.id
      @order_items.item_id = cart_item.item.id
      @order_items.tax_price = cart_item.item.price * 1.1
      @order_items.amount = cart_item.amount
      @order_items.save
    end
    # cart_itemの中の情報を消す(全て)
    current_customer.cart_items.destroy_all
    # redirect先を決める
    redirect_to orders_complete_path
  end
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
 

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :postage, :total_price, :status, :select_address, :address_id)
  end
  
  def order_item_exist?
    if current_customer.cart_items.present? == false
      redirect_to cart_items_path
    end
  end
end
