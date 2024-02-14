class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum payment_method: { credit_card: 1, transfer: 2 }
  enum order_status_method: { waiting_for_payment: 1, confirm_payment: 2, in_production: 3, ready_to_ship: 4, shipped: 5 }

end
