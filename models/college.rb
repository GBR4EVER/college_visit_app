
class College < ActiveRecord::Base
  has_many :scholarships
  has_and_belongs_to_many :students
  
  attr_accessor :address, :lattitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
