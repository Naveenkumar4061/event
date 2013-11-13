class CreateRefineryEventsVenues < ActiveRecord::Migration
  def change
    create_table :refinery_events_venues do |t|
      t.string :venue
      t.string :country
      t.string :state
      t.string :city
      t.string :locality
      t.string :pincode
      t.integer :event_id
      t.timestamps
    end
  end
end
