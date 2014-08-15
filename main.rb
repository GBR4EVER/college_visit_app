require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"
require "geocoder"

require_relative "./models/student.rb"
require_relative "./models/scholarship.rb"
require_relative "./models/college.rb"


get "/" do
  @students = Student.all # This is a class-method that we made.
  erb :home
end

get "/search" do
  @colleges = College.all
  erb :search
end

binding.pry
