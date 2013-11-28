class CreateRefineryEventsOutlets < ActiveRecord::Migration
  def change
    create_table :refinery_events_outlets do |t|
      t.string :outlet
      t.string :address
      t.string :timing
      t.integer :event_id
      t.timestamps
    end
  end
end
