class CreateInstitutes < ActiveRecord::Migration
  def change
    create_table :institutes do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.string :phone_number
      t.string :image
      t.integer :status, :default => 2
      t.integer :role_id, :null => false
      t.integer :city_id, :null => false
      t.integer :district_id, :null => false
      t.string :address

      t.timestamps
    end
  end
end
