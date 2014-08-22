require "pry"

class College < ActiveRecord::Base
  has_many :reviews
  has_and_belongs_to_many :students
  
  # 'extend' is initializing our Geocoder gem to run within the College class.
  # We must point Geocoder to ActiveRecord to interact with our database.
  extend Geocoder::Model::ActiveRecord
  
  # 'geocoded_by' is pointing our geocoder gem to the attribute (or column) in our colleges table.
  geocoded_by :address
  # After geocoder validates that we have a attribute with the key ':address' within our table,
  # it will now find the coordinates in correlation with the address (or value) given.
  after_validation :geocode, :if => :address_changed?
  # The ':if => :address_changed?' will simply update the new coordinates after validation.
  
  
  def location
    b = []
    b << latitude
    b << longitude
    Geocoder.coordinates(b)
  end
 
  def coords
    a = Geocoder.coordinates(school)
    lat = a[0]
    long = a[1]
    update(latitude: lat)
    update(longitude: long)
  end


end

binding.pry
