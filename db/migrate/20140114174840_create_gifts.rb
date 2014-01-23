class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.integer :invite_id
      t.integer :user_id      
      t.integer :registration_id
      t.integer :attendee_id
      t.integer :ticket_id
      t.integer :event_id
      
      t.integer :gifted_by
      t.boolean :accepted, :default => false
      t.timestamps
    end
  end
end
