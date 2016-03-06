require_relative '../spec_helper.rb'
require_relative '../../app/models/user.rb'


describe User, type: :model do 

	it "has valid calendar events, stocks, and transations" do
	should have_many(:calendar_events)
	should have_many(:stock_notes)

	#The aggregate of all transactions
	should have_many(:stock_transactions)

	#Specific types of transactions
	should have_many(:purchase_transactions)
	should have_many(:sale_transactions)


	end
end

	


 #  # create valid user and verify auth
 #  def test_create_with_omniauth
 #  	# make user
 #  	# 
 #  	puts '1'
 #  	test_verify_auth_valid
 #  	puts '2'
 #  end

