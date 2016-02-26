class User < ActiveRecord::Base
	has_many :calendar_events
	has_many :stock_notes

	#The aggregate of all transactions
	has_many :stock_transactions

	#Specific types of transactions
	has_many :purchase_transactions
	has_many :sale_transactions

    def self.create_with_omniauth(auth)
        create! do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]

            split_name = auth["info"]["name"].strip.split
            user.first_name = split_name[0]
            user.last_name = split_name[1..split_name.length] if split_name.length > 0
            user.email = auth["info"]["email"]

            #from auth["info"] we can also get:
            # image
            # GitHub (url to gh home page)
            # nickname (username)
            #
            #There is also more things like hireable, location, public_gists, public_repos 
        end
    end
end
