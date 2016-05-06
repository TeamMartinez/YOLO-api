class AddMoneyToUser < ActiveRecord::Migration
  def change
    add_column :users, :money, :float, :default => 1000.00
  end
end
