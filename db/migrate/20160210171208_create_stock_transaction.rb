class CreateStockTransaction < ActiveRecord::Migration
  def change
    create_table :stock_transactions do |t|
      t.integer :user_id
      t.string :ticker
      t.integer :amount
      t.float :market_value

      t.timestamps
    end
  end
end
