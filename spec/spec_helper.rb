ENV['RACK_ENV'] = 'test'
  
  require "sinatra/activerecord"
  
  require "sqlite3"

  require_relative "../models/student.rb"
  require_relative "../models/scholarship.rb"
  require_relative "../models/college.rb"

  RSpec.configure do |config|
    Student.delete_all
    Scholarship.delete_all
    College.delete_all
  end
  