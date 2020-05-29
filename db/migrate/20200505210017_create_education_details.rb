class CreateEducationDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :education_details do |t|
      t.string :college_name
      t.string :degree
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
