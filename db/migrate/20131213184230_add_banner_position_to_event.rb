class AddBannerPositionToEvent < ActiveRecord::Migration
  def change
    add_column :refinery_events, :banner_position, :integer

  end
end
