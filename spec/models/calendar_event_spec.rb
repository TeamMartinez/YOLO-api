require 'spec_helper'
require_relative '../../app/models/calendar_event.rb'

describe CalendarEvent, type: :model do
   it "is valid with user_id, name, location, start time, end time, created at, and updated at values" do
      calEvent = CalendarEvent.create!(
         user_id: 1,
         name: 'testEvent',
         location: 'Right Here',
         start_time: DateTime.new(2016, 3, 3, 4, 30, 0),
         end_time: DateTime.new(2016, 3, 3, 5, 30, 0),
         created_at: DateTime.new(2016, 2, 27, 3, 37, 23),
         updated_at: DateTime.new(2016, 3, 1, 4, 14, 51)
         )
      expect(calEvent).to be_valid
   end
end

