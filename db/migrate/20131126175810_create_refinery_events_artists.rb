class CreateRefineryEventsArtists < ActiveRecord::Migration
  def change
    create_table :refinery_events_artists do |t|
      t.attachment :artist
      t.text :description
      t.integer :event_id
      t.timestamps
    end
  end
end
