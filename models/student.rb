
class Student < ActiveRecord::Base
  has_many :Scholarship
  has_and_belongs_to_many :College
end
