class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status: {
    pending: 1,
    waiting_for_production: 2,
    in_production: 3,
    production_completed: 4
  }

def sum_price
  self.tax_price * self.amount
end

end
