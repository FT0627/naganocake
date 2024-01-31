class Order < ApplicationRecord
  belongs_to :customers
  has_many :order_items
end
