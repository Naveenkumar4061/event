class AddWarningToEvent < ActiveRecord::Migration
  def change
    add_column :refinery_events, :censor_warning, :text
    add_column :refinery_events, :print_tickets, :boolean
    add_column :refinery_events, :parking_info, :text
  end
end
