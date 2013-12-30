class CreateWorkspaceResponses < ActiveRecord::Migration
  def change
    create_table :workspace_responses do |t|
      t.integer :user_id
      t.string :response
      t.integer :workspace_id

      t.timestamps
    end
  end
end
