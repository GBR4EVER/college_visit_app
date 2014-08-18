require "pry"

class College < ActiveRecord::Base
  has_many :scholarships
  has_and_belongs_to_many :students
  
  attr_accessor :address, :latitude, :longitude
  
  extend Geocoder::Model::ActiveRecord
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  
  def location
    b = []
    b << latitude
    b << longitude
    Geocoder.coordinates(b)
  end
 
  def coords
    a = Geocoder.coordinates(name)
    lat = a[0]
    long = a[1]
    update(latitude: lat)
    update(longitude: long)
  end
end

binding.pry
