class CalendarEvent < ActiveRecord::Base
	belongs_to :user

	# used when writing calendar event to file for download
	def write_line
		"#{self.name}, #{self.location}, #{self.start_time}, #{self.end_time}"
	end
end