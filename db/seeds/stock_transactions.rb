transaction_types = ["PurchaseTransaction", "SaleTransaction"]
user_ids = User.all.pluck(:id)
stockMap = {
	"ABX" => "Barrick Gold Corp.",
	"FCF" => "First Commonwealth Financial Corp.",
	"PACD" => "Pacific Drilling S.A.",
	"TAP" => "Molsen Coors. Brewing Company"
}
stocks = stockMap.keys

100.times do
	transaction_type = transaction_types.sample
	stock = stocks.sample
	StockTransaction.create(type: transaction_type,
		user_id: user_ids.sample, abbreviation: stock,
		name: stockMap[stock], market_value: Faker::Number.decimal(2))
end