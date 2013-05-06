class City < ActiveRecord::Base
  has_one  :student
  has_one :institute

  def self.get_name id
    if id
      city = City.find(:first, :conditions => {:id => id})
      city[:city] if city
    end
  end

end
