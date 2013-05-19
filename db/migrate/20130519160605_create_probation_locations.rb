class CreateProbationLocations < ActiveRecord::Migration
  def change
    create_table :probation_locations do |t|
      t.string :student_no, :null => false
      t.string :probation_type, :null => false
      t.string :institute_name, :null => false
      t.date   :start_date
      t.date   :finish_date
      t.integer :status, :default => 2

      t.timestamps
    end
  end
end
