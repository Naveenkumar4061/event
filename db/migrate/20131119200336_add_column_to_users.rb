class AddColumnToUsers < ActiveRecord::Migration
  change_table(:users) do |t|
    t.string :full_name
    t.integer :age
    t.string :gender
    t.string :designation
    t.string :company
    
  end
end
