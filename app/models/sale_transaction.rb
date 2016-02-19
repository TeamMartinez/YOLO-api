class SaleTransaction < StockTransaction
	belongs_to :user

	# helper used when calculating total profit for
	# collection of generic StockTransaction objects
	def value
		self.market_value
	end
end