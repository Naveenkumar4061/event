class CreateRefineryEventsFaqs < ActiveRecord::Migration
  def change
    create_table :refinery_events_faqs do |t|
      t.text :question
      t.text :answer
      t.integer :event_id

      t.timestamps
    end
  end
end
