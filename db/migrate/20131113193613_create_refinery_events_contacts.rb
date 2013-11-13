class CreateRefineryEventsContacts < ActiveRecord::Migration
  def change
    create_table :refinery_events_contacts do |t|
      t.string :name
      t.string :emailids
      t.string :website_url
      t.string :facebook_link
      t.integer :event_id
      t.timestamps
    end
  end
end
