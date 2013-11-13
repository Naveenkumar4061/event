class CreateRefineryEventsForms < ActiveRecord::Migration
  def change
    create_table :refinery_events_forms do |t|
      t.integer :event_id
      t.timestamps
    end
  end
end
