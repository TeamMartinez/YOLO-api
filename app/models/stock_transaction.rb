class StockTransaction < ActiveRecord::Base
	belongs_to :user

	# used when writing stock transaction history to file for download
	def write_line
		"#{self.ticker}, #{self.amount}, #{self.market_value} \n"
	end
end