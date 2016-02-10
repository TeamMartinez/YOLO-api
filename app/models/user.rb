class User < ActiveRecord::Base
	#The aggregate of all transactions
	has_many :stock_transactions

	#Specific types of transactions
	has_many :purchase_transactions
	has_many :sale_transactions
end