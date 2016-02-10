class CreateStockTransaction < ActiveRecord::Migration
  def change
    create_table :stock_transactions do |t|
    	t.string :type
    	t.integer :user_id
    	t.string :abbreviation
    	t.string :name
    	t.float :market_value

    	t.timestamps
    end
  end
end
