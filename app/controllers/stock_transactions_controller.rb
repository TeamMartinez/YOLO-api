class StockTransactionsController < ApplicationController

  api :GET, '/stock_transactions', 'Get all of the authenticated users Stock Transactions'
  def index
    @stocks = @current_user.stock_transactions
    render json: @stocks
  end

  api :GET, '/stock_transactions/:id', 'Get a specific stock transaction'
  param :id, Integer, 'The id of the Stock Transaction'
  def show
    @stock = StockTransaction.find(params[:id])
    render json: @stock
  end

  api :POST, '/stock_transactions', 'Create a new stock transaction'
  param :stock_transaction, Hash, 'The stock transaction to create' do
    param :type, String, 'The type of transaction to create (SaleTransaction or PurchaseTransaction)'
    param :abbreviation, String, 'The NYSE abbreviation for the stock'
    param :name, String, 'The full name of the stock'
    param :market_value, Float, 'The transaction amount'
  end
  def create
    @current_user.create_stock_transaction(stock_transaction_params)
  end

  private
  def stock_transaction_params
    params.require(:stock_transaction).permit(:abbreviation, :name, :market_value)
  end
end