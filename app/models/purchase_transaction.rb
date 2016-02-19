class PurchaseTransaction < StockTransaction
	belongs_to :user

	# helper used when calculating total profit of
	# generic collection of StockTransaction objects
	def value
		(-1) * self.market_value
	end
end