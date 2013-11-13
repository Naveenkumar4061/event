class CreateRefineryEventsFormFieldOptions < ActiveRecord::Migration
  def change
    create_table :refinery_events_form_field_options do |t|
      t.integer :form_field_id
      t.string :value
      t.timestamps
    end
  end
end
