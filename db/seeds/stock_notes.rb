user_ids = User.all.pluck(:id)
stock_abbreviations = ["ABX", "FCF", "PACD", "TAP"]

50.times do
	StockNote.create(user_id: user_ids.sample, stock_abbreviation: stock_abbreviations.sample, 
		note: Faker::Hipster.sentence())
end