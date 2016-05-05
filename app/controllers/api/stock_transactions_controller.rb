class Api::StockTransactionsController < ApplicationController

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
  param :type, String, 'The type of transaction to create (SaleTransaction or PurchaseTransaction)'
  param :abbreviation, String, 'The NYSE abbreviation for the stock'
  param :name, String, 'The full name of the stock'
  param :market_value, Float, 'The transaction amount'
  def create
    # If the user is attempting to purchase a stock, make sure they have enough money
    if params[:type].eq('PurchaseTransaction')
      if @current_user.money - params[:market_value] < 0
        render json: { errors: "User does not have enough money to purchase stock" }
      end
    end

    if @current_user.stock_transactions.create(stock_transaction_params)
      render json: @current_user.stock_transactions
    end
  end

  api :GET, '/stock_transactions/download', 'Download the authenticated user\'s transaction history'
  def download
    #get all of the users transactions
    @transactions = @current_user.stock_transactions

    # create /public/stock_transactions if DNE
    create_download_dir

    # file name composed of SecureRandom base 64 web safe string
    secure_string = SecureRandom.base64
    file_path = "public/stock_history/history_" + secure_string + ".txt"
    download_history(file_path)

    #return the location of the file (do not actually send the entire file back)
    render json: {location: file_path}
  end

  api :DELETE, '/stock_transactions', 'Destroy all stock transaction records for authenticated user'
  def destroy
    @transactions = @current_user.stock_transactions
    if @transactions.destroy_all
      render json: @transactions
    else
      render json: @transactions.errors
    end
  end

  private
  def stock_transaction_params
    params.permit(:abbreviation, :name, :market_value)
  end

  def create_download_dir
    Dir.mkdir('public/stock_history') unless File.exists?('public/stock_history')
  end

  def download_history(file_path)
    open(file_path, 'w') do |f|
      @transactions.each do |transaction|
        f << transaction.write_line
      end
    end
  end
end