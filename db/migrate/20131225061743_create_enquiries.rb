class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :name
      t.string :email
      t.string :telephone
      t.string :type_of_enq
      t.string :category
      t.string :sub_category
      t.string :message

      t.timestamps
    end
  end
end
