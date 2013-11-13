class CreateRefineryEventsAttendeeDetails < ActiveRecord::Migration
  def change
    create_table :refinery_events_attendee_details do |t|
      t.integer :field_id
      t.string :value
      t.integer :attendee_id
      t.timestamps
    end
  end
end
