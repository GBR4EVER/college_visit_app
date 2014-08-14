require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"

require_relative "./models/studen.rb"
require_relative "./models/scholarship.rb"
require_relative "./models/college.rb"

# get "/" do
#   @all_todos = Todo.all # This is a class-method that we made.
#   erb :home
# end

binding.pry