class CreateRefineryEventsFormFields < ActiveRecord::Migration
  def change
    create_table :refinery_events_form_fields do |t|
      t.string :field_name
      t.string :field_type
      t.boolean :is_mandatory
      t.integer :form_id
      t.integer :sequence_no
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
