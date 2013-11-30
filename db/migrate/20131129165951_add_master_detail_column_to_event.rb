class AddMasterDetailColumnToEvent < ActiveRecord::Migration
  def change
    add_column :refinery_events, :only_master_attendee, :boolean, :default => true
    add_column :refinery_events, :publish_banner, :boolean, :default => false
    add_column :refinery_events, :published_by_eo, :boolean, :default => false
  end
end
