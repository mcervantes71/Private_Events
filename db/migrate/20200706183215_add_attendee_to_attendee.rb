class AddAttendeeToAttendee < ActiveRecord::Migration[6.0]
  def change
    add_column :attendees, :attendee, :integer
    add_column :attendees, :attended_event, :integer
  end
end
