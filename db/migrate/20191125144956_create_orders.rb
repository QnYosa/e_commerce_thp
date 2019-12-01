class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.datetime :date

      t.timestamps
    end
  end
end
