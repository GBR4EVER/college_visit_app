require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"
require "geocoder"

require_relative "./models/student.rb"
require_relative "./models/scholarship.rb"
require_relative "./models/college.rb"

# INDEX
get "/students/index" do
  @all_students = Student.all # This is a class-method that we made.
  erb :student_index
end

#NEW
get "/students/new" do
  erb :student_new
end

#CREATE
get "/students/create" do
  @student = Student.create({name: params[:name], age: params[:age]})
  erb :student_create
end

#EDIT
get "/students/:id/edit" do
  @student = Student.find(params[:id])
  erb :student_edit
end

#UPDATE
post "/students/:id/update" do
  @student = Student.find(params[:id])
  @student.update.attributes({name: params[:name], age: params[:age]})
  erb :student_update
end

#DELETE - Most of the time your delete will be a 'post' route.
get "/students/:id/delete" do
  @student = Student.find(params[:id]).delete
  erb :delete
end

# SHOW
get "/students/:id" do
  @students = Student.find(params[:id])
  erb :student_show
end


