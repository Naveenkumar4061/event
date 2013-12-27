class AddColumnToPartner < ActiveRecord::Migration
  def change
    add_column :refinery_partners, :area, :string
    add_column :refinery_partners, :city, :string
    add_column :refinery_partners, :state, :string
    add_column :refinery_partners, :deleted_at, :datetime
  end
end
