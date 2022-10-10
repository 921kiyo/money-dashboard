require_relative('../models/category')
require_relative('../models/transaction')
require_relative('./application_controller')

before '/categories' do
  require_user
end

before '/categories/*' do
  require_user
end

#Index
get "/categories" do
  @categories = Category.all
  erb(:"categories/index")
end

#New
get "/categories/new" do
  @categories = Category.all
  erb(:"categories/new")
end
#Create
post "/categories" do
  category = Category.new(params)
  category.save
  redirect(to("/transactions/new"))
end

#Delete
post "/categories/:id/delete" do
  @category = Category.delete(params[:id])
  flash[:notice] = "Successfully deleted!"
  redirect(to("/categories/new"))
end