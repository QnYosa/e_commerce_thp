class ForeignKeyOrders < ActiveRecord::Migration[5.2]
  def change
    add_index :orders, :cart_id
  end
end
