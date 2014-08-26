require "rubygems"
require "bundler"
Bundler.require

require_relative "./models/student.rb"
require_relative "./models/review.rb"
require_relative "./models/college.rb"
require_relative "./routes/students.rb"
require_relative "./routes/colleges.rb"

#-----------Students---------------#

# INDEX
get "/students/index" do
  @all_students = Student.all # This is a class-method that we made.
  erb :student_index
end

# NEW
get "/students/new" do
  erb :student_new
end

# CREATE
post "/students/create" do
  @student = Student.create({name: params[:name], age: params[:age]})
  erb :student_create
end

# EDIT
get "/students/:id/edit" do
  @student = Student.find(params[:id])
  erb :student_edit
end

# UPDATE
post "/students/:id/update" do
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

#-------------College----------#

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
post "/colleges/create" do
  @college = College.create({school: params[:school], nickname: params[:nickname], tuition: params[:tuition], bio: params[:bio], address: params[:address], latitude: params[:longitude], longitude: params[:longitude], region: params[:region]})
  erb :college_create
end

#EDIT
get "/colleges/:id/edit" do
  @college = College.find(params[:id])
  erb :college_edit
end

#UPDATE
post "/colleges/:id/update" do
  @college = College.find(params[:id])
  @college.update_attributes({school: params[:school], nickname: params[:nickname], tuition: params[:tuition], bio: params[:bio], address: params[:address], latitude: params[:longitude], longitude: params[:longitude], region: params[:region]})
  erb :college_update
end

#DELETE - Most of the time your delete will be a 'post' route.
get "/colleges/:id/delete" do
  @college = College.find(params[:id]).delete
  erb :college_delete
end

# SHOW
get "/colleges/:id" do
  @college = College.find(params[:id])
  erb :college_show
end

binding.pry
#-----------Student(s) with College(s)-----------#

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


