class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :person_id
      t.index :person_id
      t.integer :location_id
      t.index :location_id
      t.string :role
      t.timestamps
    end
  end
end
