class CreateWorkspaces < ActiveRecord::Migration
  def change
    create_table :workspaces do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.string :category
      t.string :sub_category
      t.string :url
      t.string :description
      t.integer :position
      t.integer :created_by
      t.integer :updated_by
      t.text :schedule
      t.text :terms_conditions
      t.boolean :published
      t.integer :partner_id
      t.boolean :published_by_eo
      t.attachment :banner 
      t.attachment :thumbnail
      t.text :venue

      t.timestamps
    end
  end
end
