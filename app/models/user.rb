class User < ActiveRecord::Base
	has_many :calendar_events

	#The aggregate of all transactions
	has_many :stock_transactions

	#Specific types of transactions
	has_many :purchase_transactions
	has_many :sale_transactions
end