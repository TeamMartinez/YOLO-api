prng = Random.new
10.times do
	money = prng.rand() * 10000
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
		email: Faker::Internet.email, money: money)
end