require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"
require "geocoder"

require_relative "./models/student.rb"
require_relative "./models/review.rb"
require_relative "./models/college.rb"

# INDEX
get "/student/index" do
  @all_students = Student.all # This is a class-method that we made.
  erb :student_index
end

# NEW
get "/student/new" do
  erb :student_new
end

# CREATE
post "/student/create" do
  @student = Student.create({name: params[:name], age: params[:age]})
  erb :student_create
end

# EDIT
get "/student/:id/edit" do
  @student = Student.find(params[:id])
  erb :student_edit
end

# UPDATE
post "/student/:id/update" do
  @student = Student.find(params[:id])
  @student.update_attributes({name: params[:name], age: params[:age]})
  erb :student_update
end

#DELETE - Most of the time your delete will be a 'post' route.
get "/students/:id/delete" do
  @student = Student.find(params[:id]).delete
  erb :student_delete
end

# SHOW
get "/students/:id" do
  @student = Student.find(params[:id])
  erb :student_show
end

binding.pry
#-------Colleges---------#

# INDEX
get "/colleges/index" do
  @all_colleges = College.all # This is a class-method that we made.
  erb :college_index
end

#NEW
get "/colleges/new" do
  erb :college_new
end

#CREATE
get "/colleges/create" do
  @college = College.create({school: params[:school], nickname: params[:nickname], bio: params[:bio], tuition: params[:tuition], logo: params[:logo], address: params[:address], region: params[:region], webpage: params[:webpage]})
  erb :college_create
end

#EDIT
get "/colleges/:college_id/edit" do
  @college = College.find(params[:college_id])
  erb :college_edit
end

#UPDATE
post "/colleges/:college_id/update" do
  @college = College.find(params[:college_id])
  @college.update_attributes({college_id: params[:college_id], school: params[:school], nickname: params[:nickname], bio: params[:bio], tuition: params[:tuition], logo: params[:logo], address: params[:address], region: params[:region], webpage: params[:webpage]})
  erb :college_update
end

#DELETE - Most of the time your delete will be a 'post' route.
get "/colleges/:college_id/delete" do
  @college = College.find(params[:college_id]).delete
  erb :college_delete
end

# SHOW
get "/colleges/:college_id" do
  @colleges = College.find(params[:college_id])
  erb :college_show
end

binding.pry
# #-----------Student(s) with College(s)-----------#
#
# # INDEX
# get "students/:student_id/colleges" do
#   @student = Student.find(params[:id])
#   @all_colleges = @student.colleges
#   erb :colleges_index
# end
#
# # NEW
# get "students/:student_id/new_colleges" do
#   @student = Student.find(params[:id])
#   erb :college_new
# end
#
# get "/colleges/new_student_plus" do
#   erb :colleges_plus_new_student
# end
#
# # CREATE
# get "/colleges/:student_id/create_college" do
#   @colleges = College.create({name: params[:name], student_id: params[:student_id]})
#   erb :colleges_create
# end
#
# # EDIT
#
# # UPDATE
#
# # DELETE
#
# # SHOW
  

