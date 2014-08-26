# INDEX
get "/students/index" do
  @all_students = Student.all # This is a class-method that we made.
  erb :"Student/student_index"
end

# NEW
get "/students/new" do
  erb :"Student/student_new"
end

# CREATE
post "/students/create" do
  @student = Student.create({name: params[:name], age: params[:age]})
  erb :"Student/student_create"
end

# EDIT
get "/students/:id/edit" do
  @student = Student.find(params[:id])
  erb :"Student/student_edit"
end

# UPDATE
post "/students/:id/update" do
  @student = Student.find(params[:id])
  @student.update_attributes({name: params[:name], age: params[:age]})
  erb :"Student/student_update"
end

#DELETE - Most of the time your delete will be a 'post' route.
get "/students/:id/delete" do
  @student = Student.find(params[:id]).delete
  erb :"Student/student_delete"
end

# SHOW
get "/students/:id" do
  @student = Student.find(params[:id])
  erb :"Student/student_show"
end