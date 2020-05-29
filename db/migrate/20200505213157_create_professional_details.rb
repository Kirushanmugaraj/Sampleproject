class CreateProfessionalDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_details do |t|
      t.string :prev_employer
      t.string :position
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
