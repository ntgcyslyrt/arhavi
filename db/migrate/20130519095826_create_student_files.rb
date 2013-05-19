class CreateStudentFiles < ActiveRecord::Migration
  def change
    create_table :student_files do |t|
      t.integer :student_id, :null => :false
      t.string :name, :null => :false
      t.string :file, :null => :false
      t.timestamps
    end
  end
end
