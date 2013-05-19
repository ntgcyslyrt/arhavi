class ProbationLocation < ActiveRecord::Base
  # attr_accessible :title, :body
attr_accessible :student_no, :probation_type, :institute_name, :start_date, :finish_date, :status 
end
