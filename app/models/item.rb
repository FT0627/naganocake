class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_items
  
  has_one_attached :image
  
  validates :is_sold_out, inclusion: [false, true]
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre.name, presence: true
  
end
