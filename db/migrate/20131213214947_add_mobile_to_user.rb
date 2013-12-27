class AddMobileToUser < ActiveRecord::Migration
  def change
    add_column :users, :mobile, :string
    add_column :users, :dob, :string
  end
end
