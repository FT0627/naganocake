class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  
  attribute :select_address
  attribute :address_id
  
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment_method, presence: true

  enum payment_method: {
    credit_card: 1,
    transfer: 2
  }

  enum status: {
    waiting_for_payment: 1,
    confirm_payment: 2,
    in_production: 3,
    ready_to_ship: 4,
    shipped: 5,
  }
  
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

  
end