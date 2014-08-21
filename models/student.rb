class Student < ActiveRecord::Base
  has_many :scholarships
  has_and_belongs_to_many :colleges
  
  validates :name, :age, presence: true
end
