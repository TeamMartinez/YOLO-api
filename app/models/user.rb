class User < ActiveRecord::Base
  has_many :calendar_events
  has_many :stock_notes

  #The aggregate of all transactions
  has_many :stock_transactions

  #Specific types of transactions
  has_many :purchase_transactions
  has_many :sale_transactions

  validates_numericality_of :money, greater_than_or_equal_to: 0

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]

      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end
end
