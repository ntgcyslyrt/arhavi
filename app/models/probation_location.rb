class ProbationLocation < ActiveRecord::Base
  # attr_accessible :title, :body
attr_accessible :probation_type, :institute_name, :start_date, :finish_date 
end
