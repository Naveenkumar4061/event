class CreateRefineryEventsOutlets < ActiveRecord::Migration
  def change
    create_table :refinery_events_outlets do |t|
      t.string :outlet
      t.string :address
      t.string :timing
      t.string :event_id
      t.timestamps
    end
  end
end
