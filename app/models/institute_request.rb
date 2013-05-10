class InstituteRequest < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :institute_id, :probation_advert_id, :content, :status
  belongs_to :institute
  belongs_to :probation_advert
end
