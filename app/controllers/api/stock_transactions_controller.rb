class Api::StockTransactionsController < ApplicationController

  def index
    @stocks = @current_user.stock_transactions
    render json: @stocks
  end

  def show
    @stock = StockTransaction.find(params[:id])
    render json: @stock
  end

  def create
    if params[:type].eql?('PurchaseTransaction')
      @current_user.money -= params[:market_value]
      @current_user.purchase_transactions.build(stock_transaction_params)      
    else
      @current_user.money += params[:market_value]
      @current_user.sale_transactions.build(stock_transaction_params)
    end

    if @current_user.save
      render json: @current_user.stock_transactions
    else
      render json: { errors: @current_user.errors }
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
    params.permit(:type, :abbreviation, :name, :market_value)
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
