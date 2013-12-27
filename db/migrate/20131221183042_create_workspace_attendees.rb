class CreateWorkspaceAttendees < ActiveRecord::Migration
  def change
    create_table :workspace_attendees do |t|
      t.integer :workspace_id
      t.integer :user_id
      t.boolean :attending
      t.boolean :maybe
      t.boolean :wont_attend
      t.timestamps
    end
  end
end
