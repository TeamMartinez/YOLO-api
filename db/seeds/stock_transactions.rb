user_ids = User.all.pluck(:id)
tickers = ["ABX", "FCF", "PACD", "TAP"]
prng = Random.new

100.times do
	StockTransaction.create(user_id: user_ids.sample, ticker: tickers.sample,
		amount: prng.rand(-10..10), market_value: Faker::Number.decimal(2))
end