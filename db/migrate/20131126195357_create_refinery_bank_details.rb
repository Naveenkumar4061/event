class CreateRefineryBankDetails < ActiveRecord::Migration
  def change
    create_table :refinery_bank_details do |t|
      t.string :account_name
      t.integer :account_number
      t.string :bank_name
      t.string :branch
      t.string :ifsc
      t.string :account_type
      t.integer :user_id

      t.timestamps
    end
  end
end
