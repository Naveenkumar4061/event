class AddClientDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :c_company_name, :string
    add_column :users, :c_address, :string
    add_column :users, :c_area, :string
    add_column :users, :c_city, :string
    add_column :users, :c_state, :string
  end
end
