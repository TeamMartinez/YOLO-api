class Api::CalendarEventsController < ApplicationController

  def index
    @events = @current_user.calendar_events
    render json: @events
  end

  def show
    @event = CalendarEvent.find(params[:id])
    render json: @event
  end

  def destroy
    if CalendarEvent.destroy(params[:id])
      render json: @current_user.calendar_events
    end
  end

  def create
    if @current_user.calendar_events.create(calendar_event_params)
      render json: @current_user.calendar_events
    end
  end

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
    params.permit(:name, :location, :start_time, :end_time)
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
