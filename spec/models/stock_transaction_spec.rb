
require 'spec_helper'
require_relative '../../app/models/stock_transaction.rb'

describe StockTransaction, type: :model do
   # Determines if a CalendarEvent with arbitrary values (that fit the defined model) is valid
   it "is valid with type, abbreviation, name, and market_value" do
      newStockTr = StockTransaction.create!(
         user_id: 1,
         #type: 'json', # csv?
         abbreviation: 'AAPL',
         name: 'Apple',
         market_value: '1337'
      )
      expect(newStockTr).to be_valid
   end
end