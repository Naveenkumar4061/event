class AddSiteToPartner < ActiveRecord::Migration
  def change
    add_column :refinery_partners, :site, :string
  end
end
