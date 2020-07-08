class AddIdToAttendee < ActiveRecord::Migration[6.0]
  def change
    add_column :attendees, :attendee_id, :integer
    add_column :attendees, :attended_event_id, :integer
    remove_column :attendees, :attendee
    remove_column :attendees, :attended_event
    remove_column :attendees, :user_id
    remove_column :attendees, :event_id
  end
end
