prng = Random.new
10.times do
  money = prng.rand() * 10000
  name = Faker::Name.first_name + ' ' + Faker::Name.last_name
  User.create(name: name, email: Faker::Internet.email, money: money)
end