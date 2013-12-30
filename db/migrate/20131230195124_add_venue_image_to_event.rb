class AddVenueImageToEvent < ActiveRecord::Migration
  def change
    add_attachment :refinery_events, :venue_image
  end
end
