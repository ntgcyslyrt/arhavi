class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string  :first_name, :null => false
      t.string  :last_name, :null => false
      t.string  :email, :null => false
      t.string  :password_digest, :null => false
      t.string  :image
      t.string  :phone_number
      t.integer :status, :default => 2

      t.timestamps
    end
  end
end
