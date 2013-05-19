class StudentFile < ActiveRecord::Base

  belongs_to :student

  attr_accessible :student_id, :name, :file
  validates_presence_of :student_id, :name, :file

  mount_uploader :file, StudentFileUploader

end
