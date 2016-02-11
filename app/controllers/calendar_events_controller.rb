class CalendarEventsController < ApplicationController

	def index
		@events = @current_user.calendar_events
		render json: @events
	end

	def show
		@event = CalendarEvent.find(params[:id])
		render json: @event
	end

#	def create
#		@current_user.create_calendar_event(calendar_event_params)
#	end
#
#	private
#	def calendar_event_params
#		params.require(:calendar_event).permit(:name, :location, :start_time, :end_time)
#	end
end