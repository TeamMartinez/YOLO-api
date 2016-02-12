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

#	def create
#		@current_user.create_stock_transaction(stock_transaction_params)
#	end
#
#	private
#	def stock_transaction_params
#		params.require(:stock_transaction).permit(:abbreviation, :name, :market_value)
#	end
end