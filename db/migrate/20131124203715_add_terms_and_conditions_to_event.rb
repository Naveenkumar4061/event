class AddTermsAndConditionsToEvent < ActiveRecord::Migration
  def change
    add_column :refinery_events , :terms_conditions, :text
  end
end
