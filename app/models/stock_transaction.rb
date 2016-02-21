class StockTransaction < ActiveRecord::Base
	belongs_to :user

	# used when writing stock transaction history to file for download
	def write_line
		"#{self.type}, #{self.abbreviation}, #{self.name}, #{self.market_value} \n"
	end
end