# INDEX
get "/colleges/index" do
  @all_colleges = College.all # This is a class-method that we made.
  erb :"College/college_index"
end

#NEW
get "/colleges/new" do
  erb :"College/college_new"
end

#CREATE
post "/colleges/create" do
  @college = College.create({school: params[:school], nickname: params[:nickname], tuition: params[:tuition], bio: params[:bio], address: params[:address], latitude: params[:longitude], longitude: params[:longitude], region: params[:region]})
  erb :"College/college_create"
end

#EDIT
get "/colleges/:id/edit" do
  @college = College.find(params[:id])
  erb :"College/college_edit"
end

#UPDATE
post "/colleges/:id/update" do
  @college = College.find(params[:id])
  @college.update_attributes({school: params[:school], nickname: params[:nickname], tuition: params[:tuition], bio: params[:bio], address: params[:address], latitude: params[:longitude], longitude: params[:longitude], region: params[:region]})
  erb :"College/college_update"
end

#DELETE - Most of the time your delete will be a 'post' route.
get "/colleges/:id/delete" do
  @college = College.find(params[:id]).delete
  erb :"College/college_delete"
end

# SHOW
get "/colleges/:id" do
  @college = College.find(params[:id])
  erb :"College/college_show"
end

# Checking to see if git is working correctly.