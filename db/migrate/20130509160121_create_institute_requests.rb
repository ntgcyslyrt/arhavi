class CreateInstituteRequests < ActiveRecord::Migration
  def change
    create_table :institute_requests do |t|
      t.string :institute_id, :null => false
      t.string :probation_advert_id, :null => false
      t.integer :status, :default => 2
      t.text :content, :null => false

      t.timestamps
    end
  end
end
