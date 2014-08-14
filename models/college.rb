
class College < ActiveRecord::Base
  has_many :Scholarship
  has_and_belongs_to_many :Student
end
