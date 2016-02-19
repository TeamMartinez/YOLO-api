class StockSummariesController < ApplicationController

	api :GET, '/stock_summary', 'Get overall and stock-specific profit totals for user'
	def index
		# get all of the transactions associated with the user
		@transactions = @current_user.stock_transactions

		# transaction.abbreviation -> [transaction]
		abbreviationMap = {}
		@transactions.each do |transaction|
			(abbreviationMap[transaction.abbreviation] ||= []) << transaction
		end

		# calculate the total profit as well as the profit for each stock
		profitMap = {}
		totalProfit = 0.0
		stockAbbreviations = abbreviationMap.keys()
		stockAbbreviations.each do |abbreviation|
			stockProfit = 0.0
			abbreviationMap[abbreviation].each do |transaction|
				stockProfit += transaction.value
				totalProfit += transaction.value
			end
			profitMap[abbreviation] = stockProfit				
		end
		profitMap["Total"] = totalProfit

		render json: profitMap
	end
end