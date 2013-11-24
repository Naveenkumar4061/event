class AddColumnToRefineryEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events , :created_by, :integer
    add_column :refinery_events , :updated_by, :integer
    add_column :refinery_events , :schedule, :text
  end
end
