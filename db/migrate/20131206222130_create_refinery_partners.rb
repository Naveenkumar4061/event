class CreateRefineryPartners < ActiveRecord::Migration
  def change
    create_table :refinery_partners do |t|
      t.string :company_name
      t.string :address
      t.string :email
      t.integer :employee_strength
      t.timestamps
    end
  end
end
