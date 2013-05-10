class ProbationAdvert < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :sayi
  has_one  :institute
  has_one  :institute_request
  def self.get_name id
    if id
      probation = ProbationAdvert.find(:first, :conditions => {:id => id})
      probation[:sayi] if sayi
    end
  end
end
