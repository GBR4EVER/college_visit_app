
class College < ActiveRecord::Base
  has_many :scholarships
  has_and_belongs_to_many :students
  attr_accesible :address, :lattitude, :longitude

  field :coordinates, :type => Array
  field :address
  
  Include Geocoder::Model::Mongoid
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end
