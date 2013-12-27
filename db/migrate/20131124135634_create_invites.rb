class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.integer :partner_id
      t.boolean :approved, :default => 1
      t.timestamps
    end
  end
end
