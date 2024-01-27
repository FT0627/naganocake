class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :tax_price, null: false
      t.integer :status, null: false, default: 1
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
