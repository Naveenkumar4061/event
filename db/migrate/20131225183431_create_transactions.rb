class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :total
      t.text :response
      t.integer :user_id
      t.string :state

      t.timestamps
    end
  end
end
