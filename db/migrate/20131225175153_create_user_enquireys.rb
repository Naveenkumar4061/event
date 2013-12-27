class CreateUserEnquireys < ActiveRecord::Migration
  def change
    create_table :user_enquireys do |t|
      t.string :email
      t.string :subject
      t.string :category
      t.string :subcategory
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
