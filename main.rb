require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"

require_relative "./models/student.rb"
require_relative "./models/scholarship.rb"
require_relative "./models/college.rb"

$db = SQLite3::Database.new "college_visit_app.db"
$db.results_as_hash = true

require_relative "./student.rb"


get "/" do
  @all_students = Student.all # This is a class-method that we made.
  erb :home
end

binding.pry
