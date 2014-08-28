# INDEX
get "/reviews/index" do
  @all_reviews = @review.all
  erb :review_index
end

# NEW
get "/reviews/new" do
  erb :review_new
end

# CREATE
get "/reviews/create" do
  @review = Review.create({rating: params[:rating], content: params[:content]})
  erb :review_create
end

# EDIT
get "/reviews/:id/edit" do
  @review = Review.find(params[:id])
  erb :review_edit
end

# UPDATE
get "/reviews/:id/update" do
  @review = Review.find(params[:id])
  @review.update_attributes({rating: params[:rating], content: params[:content]})
  erb :review_update
end

# DELETE
get "/reviews/:id/delete" do
  @review = Review.find(params[:id]).delete
  erb :college_delete
end

# SHOW
get "/reviews/:id" do
  @review = Review.find(params[:id])
  erb :college_show
end
