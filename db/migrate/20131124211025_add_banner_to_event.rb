class AddBannerToEvent < ActiveRecord::Migration
  def change
    #add_column :refinery_events , :banner_id, :integer
    add_column :refinery_events , :published, :boolean, :default => 0
    add_column :refinery_events , :pay_with_card, :boolean, :default => 0
    add_column :refinery_events , :pay_with_cash, :boolean, :default => 0
    add_column :refinery_events , :pay_with_check, :boolean, :default => 0
  end
end
