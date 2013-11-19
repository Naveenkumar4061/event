class CreateRefineryEventsTickets < ActiveRecord::Migration
  def change
    create_table :refinery_events_tickets do |t|
      t.string :ticket_name
      t.string :description
      t.datetime :sale_start_on
      t.datetime :sale_end_on
      t.decimal :original_price
      t.decimal :discounted_price
      t.decimal :commission
      t.boolean :is_service_tax
      t.decimal :service_tax_percent
      t.integer :max_quantity
      t.integer :min_quantity
      t.integer :max_quantity_on_sale
      t.integer :display_order
      t.string :status
      t.datetime :deleted_at
      t.boolean :is_sold_out
      t.boolean :is_not_display
      t.integer :tickets_sold
      t.integer :event_id
      t.timestamps
    end
  end
end
