class Student < ActiveRecord::Base
  has_many :scholarships
  has_and_belongs_to_many :colleges
  
  validates :name, :age, presence: true
  validates :name, length: { minimum: 2}
  validates :age, length: { maximum: 3}
  validates :age, numericality: { only_integer: true }

end


