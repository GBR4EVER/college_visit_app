class Review < ActiveRecord::Base
  belongs_to :students
  belongs_to :colleges
  
  validates :rating, :content, presence: true
  validates :content, length: { minimum: 10}
  validates :age, length: { maximum: 150}
  validates :rating, numericality: { only_integer: true }


end
