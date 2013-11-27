class CreateRefineryEventsGalleries < ActiveRecord::Migration
  def change
    create_table :refinery_events_galleries do |t|
      t.attachment :gimage
      t.boolean :display
      t.integer :event_id
      t.timestamps
    end
  end
end
