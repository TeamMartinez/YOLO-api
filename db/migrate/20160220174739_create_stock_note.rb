class CreateStockNote < ActiveRecord::Migration
  def change
    create_table :stock_notes do |t|
    	t.integer :user_id
    	t.string :stock_abbreviation
    	t.text :note
    	
    	t.timestamps
    end
  end
end
