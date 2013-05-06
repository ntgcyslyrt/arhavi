class District < ActiveRecord::Base
  has_one  :student
  has_one :institute

  def self.get_name id
    if id
      district = District.find(:first, :conditions => {:id => id})
      district[:district] if district
    end
  end

end
