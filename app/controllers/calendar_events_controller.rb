class CalendarEventsController < ApplicationController

	api :GET, '/calendar_events', 'Get all of the authenticated users Calendar Events'
	def index
		@events = @current_user.calendar_events
		render json: @events
	end

	api :GET, '/calendar_events/:id', 'Get a specific calendar event'
	param :id, Integer, 'Id of the Calendar Event' 
	def show
		@event = CalendarEvent.find(params[:id])
		render json: @event
	end

	api :POST, '/calendar_events', 'Create a new calendar event'
	param :calendar_event, Hash, "Calendar object to create" do
		param :name, String, 'Name of the Calendar Event'
		param :location, String, 'Location of the Calendar Event'
		param :start_time, DateTime, 'Start Time of the Event'
		param :end_time, DateTime, 'End Time of the Event'
	end 
	def create
		@current_user.create_calendar_event(calendar_event_params)
	end

	private
	def calendar_event_params
		params.require(:calendar_event).permit(:name, :location, :start_time, :end_time)
	end
end