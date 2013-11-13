class CreateRefineryEventsAttendees < ActiveRecord::Migration
  def change
    create_table :refinery_events_attendees do |t|
      t.integer :registration_id
      t.integer :ticket_id
      t.string :is_master

      t.timestamps
    end
  end
end
