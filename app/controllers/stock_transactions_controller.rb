class StockTransactionsController < ApplicationController

	api :GET, '/stock_transactions', 'Get all stock transactions'
	def index
		@stocks = @current_user.stock_transactions
		render json: @stocks
	end

	api :GET, '/stock_transactions', 'Get a specific stock transaction'
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