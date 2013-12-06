class AddLatitudeAndTitle < ActiveRecord::Migration
  def up
    add_column :refinery_events_venues, :latitude, :string
    add_column :refinery_events_venues, :longitude, :string
    add_column :refinery_events_venues, :title, :string
  end

  def down
    remove_column :refinery_events_venues, :latitude, :string
    remove_column :refinery_events_venues, :longitude, :string
    remove_column :refinery_events_venues, :title, :string
  end
end
