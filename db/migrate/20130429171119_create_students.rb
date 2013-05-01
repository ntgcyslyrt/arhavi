class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |c|
      c.integer :tc, :null => false, :limit => 8
      c.string  :first_name, :null => false
      c.string  :last_name, :null => false
      c.string  :email, :null => false
      c.string  :password_digest, :null => false
      c.string  :phone_number, :null => false
      c.string  :image
      c.string  :gender, :null => false
      c.date    :birthday, :null => false
      c.string  :address
      c.integer :city_id, :null => false
      c.integer :district_id, :null => false

      c.timestamps
    end
  end
end
