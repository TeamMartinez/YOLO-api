class Api::CalendarEventsController < ApplicationController

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
		if @current_usercalendar_events.create(calendar_event_params)
			render json: @current_user.calendar_events
		end
	end

	api :GET, '/calendar_events/:id/download', 'Download the details of a specific calendar event'
	param :id, Integer, 'Id of the Calendar Event to download'
	def download
		# get the particular calendar event
		calendar_event_id = params[:calendar_event_id]
		@calendar_event = CalendarEvent.find(calendar_event_id)

    # create /public/calendar_events if DNE
    create_download_dir
    
    # file name composed of SecureRandom base 64 web safe string
    secure_string = SecureRandom.base64
    file_path = "public/calendar_events/event_" + secure_string + ".txt"

    # write the contents of the calendar event to the file
    download_event(file_path)

    # return the location of the recently created file
		render json: {location: file_path}
	end

	private
	def calendar_event_params
		params.require(:calendar_event).permit(:name, :location, :start_time, :end_time)
	end

  def create_download_dir
    Dir.mkdir 'public/calendar_events' unless File.exists?('public/calendar_events')
  end

	# helper to write calendar event to the specified path
	def download_event(file_path)
		open(file_path, 'w') do |f|
			f << @calendar_event.write_line
		end
	end
end