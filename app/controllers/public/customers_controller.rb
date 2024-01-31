class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show

  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    redirect_to root_path
  end
end
