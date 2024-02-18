class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum order_item_status_method: 
  { 
    pending: 1, 
    waiting_for_production: 2, 
    in_production: 3, 
    production_compleated: 4 
  }
end
