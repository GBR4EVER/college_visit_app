
class College < ActiveRecord::Base
  has_many :scholarships
  has_and_belongs_to_many :students
  
  extend Geocoder::Model::ActiveRecord
  
  reverse_geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  def initialize
  end
  
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

end

