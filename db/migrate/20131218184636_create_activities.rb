class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :event_name
      t.datetime :viewed_at
      t.timestamps
    end
  end
end
