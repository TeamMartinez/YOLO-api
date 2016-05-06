class Api::StocksController < ApplicationController

  def index
    transactions = @current_user.stock_transactions
    stockMap = {}
    transactions.each do |transaction|
      if stockMap.key?(transaction.ticker)
        stockMap[transaction.ticker] += transaction.amount
      else
        stockMap[transaction.ticker] = transaction.amount
      end
    end

    stocks = []
    stockMap.keys.each do |ticker|
      stocks << {ticker: ticker, amount: stockMap[ticker]}
    end

    render json: stocks
  end
end