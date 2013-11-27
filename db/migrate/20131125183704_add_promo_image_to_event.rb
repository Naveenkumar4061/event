class AddPromoImageToEvent < ActiveRecord::Migration
  def change
    add_attachment :refinery_events, :banner
  end
end
