class Institute < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :role
  belongs_to :city
  belongs_to :district
  has_one    :institute_request

  has_secure_password

  attr_accessible :name, :role_id, :email, :password, :phone_number, :city_id, :district_id, :address, :status

  validates_presence_of :email, :name
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

  def self.get_name id
    if id
      institute = Institute.find(:first, :conditions => {:id => id})
      institute[:name] if institute
    end
  end
end
