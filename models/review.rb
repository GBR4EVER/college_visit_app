class Review < ActiveRecord::Base
  belongs_to :students
  belongs_to :colleges
end