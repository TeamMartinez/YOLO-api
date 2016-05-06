class Api::StockTransactionsController < ApplicationController

  def index
    @stocks = @current_user.stock_transactions
    render json: @stocks
  end

  def buy
    difference = params[:market_value] * params[:amount]
    @current_user.money -= difference
    @current_user.stock_transactions.create(stock_transaction_params)

    if @current_user.save
      render json: @current_user.stock_transactions
    end
  end

  def sell
    difference = params[:market_value] * params[:amount]
    @current_user.money += difference

    params[:amount] = -params[:amount]
    @current_user.stock_transactions.create(stock_transaction_params)

    if @current_user.save
      render json: @current_user.stock_transactions
    end
  end

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

  private
  def stock_transaction_params
    params.permit(:ticker, :amount, :market_value)
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
