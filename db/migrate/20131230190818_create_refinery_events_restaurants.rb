class CreateRefineryEventsRestaurants < ActiveRecord::Migration
  def change
    create_table :refinery_events_restaurants do |t|
      t.string :name
      t.attachment :restaurant_image
      t.string :address_line1
      t.string :address_line2
      t.string :phone
      t.string :distance
      t.integer :event_id

      t.timestamps
    end
  end
end
