class StockTransactionsController < ApplicationController

	def index
		@stocks = @current_user.stock_transactions
		render json: @stocks
	end

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