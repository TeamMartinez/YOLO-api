class StockTransaction < ActiveRecord::Base
	belongs_to :user

	def write_line
		"#{self.type}, #{self.abbreviation}, #{self.name}, #{self.market_value} \n"
	end
end