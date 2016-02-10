class CreateCalendarEvent < ActiveRecord::Migration
  def change
    create_table :calendar_events do |t|
    	t.integer :user_id
    	t.string :name
    	t.string :location
    	t.datetime :start_time
    	t.datetime :end_time

    	t.timestamps
    end
  end
end
