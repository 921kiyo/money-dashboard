require_relative('../models/user')
require_relative('../models/category')
require_relative('../models/analysis')
require_relative('./application_controller')
require('pry-byebug')

before '/users' do
  require_user
end

before '/users/*' do
  require_user
end

#Index by user
get "/users/:id" do
  @current_user = current_user()
  @transactions = @current_user.transactions()
  @analysis = Analysis.new( @transactions )
  @categories = Category.all()
  @merchants = Merchant.all()

  if params[:category_id] && params[:category_id].to_i && !(params[:category_id] == "")
    
    @transactions = @analysis.filter_by_category(params[:category_id] && params[:category_id].to_i )
  end
  
  if params[:merchant_id] && params[:merchant_id].to_i && !(params[:merchant_id] == "")
    
    @transactions = @analysis.filter_by_merchant( params[:merchant_id] && params[:merchant_id].to_i )
  end
  
  if params[:start_date] && params[:end_date] && !(params[:start_date] == "") && !(params[:end_date] == "")
    @transactions = @analysis.filter_by_date( params[:start_date], params[:end_date] )
  end
  
  erb(:"users/index")
end

#Show
get '/users/:id/show' do
  @user = User.find(params[:id])
  erb(:'users/show')
end

#Edit
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb(:'users/edit')
end

#Update
post '/users/:id' do
  @user = User.update(params)
  flash[:notice] = "Account info updated!"
  redirect(to("/"))
end

# #Delete
# #not used in the app
# post '/users/:id/delete' do
#   @user = User.delete(params[:id])
#   redirect(to("/users"))
# end