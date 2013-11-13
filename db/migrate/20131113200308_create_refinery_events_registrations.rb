class CreateRefineryEventsRegistrations < ActiveRecord::Migration
  def change
    create_table :refinery_events_registrations do |t|
      t.integer :no_of_tickets
      t.decimal :total
      t.decimal :discount
      t.decimal :sales_tax
      t.decimal :adjustment
      t.integer :event_id
      t.integer :user_id
      t.string :state 
      t.timestamps
    end
  end
end
