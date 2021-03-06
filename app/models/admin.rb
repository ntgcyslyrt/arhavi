class Admin < ActiveRecord::Base

  has_secure_password

attr_accessible :first_name, :last_name, :email, :password, :phone_number

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

end
