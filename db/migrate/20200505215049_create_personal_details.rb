class CreatePersonalDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_details do |t|
      t.text :address
      t.string :contact_no
      t.integer :user_id, index: true
      t.timestamps
    end
  end
end
