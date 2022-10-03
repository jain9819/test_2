class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :product_id
      t.string :order_type
      t.integer :quantity
      t.float :net_price
      t.float :discount
      t.float :total_price

      t.timestamps
    end
  end
end
