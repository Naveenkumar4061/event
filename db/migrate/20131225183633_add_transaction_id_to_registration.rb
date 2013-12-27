class AddTransactionIdToRegistration < ActiveRecord::Migration
  def change
    add_column :refinery_events_registrations, :transaction_id, :integer
  end
end
