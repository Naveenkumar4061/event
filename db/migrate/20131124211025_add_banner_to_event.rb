class AddBannerToEvent < ActiveRecord::Migration
  def change
    add_column :refinery_events , :published, :boolean, :default => true
    add_column :refinery_events , :pay_with_card, :boolean, :default => true
    add_column :refinery_events , :pay_with_cash, :boolean, :default => true
    add_column :refinery_events , :pay_with_check, :boolean, :default => true
  end
end
