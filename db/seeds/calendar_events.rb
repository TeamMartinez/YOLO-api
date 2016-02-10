user_ids = User.all.pluck(:id)
event_names = ["Birthday Party", "Office Meeting", "Dinner Date", "Hax Time"]

25.times do
	start_time = Faker::Time.forward(10)
	end_time = start_time + rand(1..5).hours
	CalendarEvent.create(
		user_id: user_ids.sample, 
		name: event_names.sample,
		location: Faker::Address.street_address,
		start_time: start_time,
		end_time: end_time)
end