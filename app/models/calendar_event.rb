class CalendarEvent < ActiveRecord::Base
	belongs_to :user

	def write_line
		"#{self.name}, #{self.location}, #{self.start_time}, #{self.end_time}"
	end
end