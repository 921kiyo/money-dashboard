require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('./application_controller')

before '/merchants' do
  require_user
end

before '/merchants/*' do
  require_user
end
#Index
get '/merchants' do 
  @merchants = Merchant.all()
  erb(:'merchants/index')
end

#New
get '/merchants/new' do
  @merchants = Merchant.all()
  erb(:'merchants/new')
end

#Create
post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save
  redirect(to("/transactions/new"))
end

# #Show
# get '/merchants/:id' do
#   @merchant = Merchant.find(params[:id])
#   erb(:'merchants/show')
# end

# #Edit
# get '/merchants/:id/edit' do
#   @merchant = Merchant.find(params[:id])
#   erb(:'merchants/edit')
# end

# #Update
# post '/merchants/:id' do
#   @merchant = Merchant.update(params)
#   redirect(to("/merchants/#{params[:id]}"))
# end

#Delete
post '/merchants/:id/delete' do
  @merchant = Merchant.delete(params[:id])
  flash[:notice] = "Store successfully deleted!"
  redirect(to("/merchants/new"))
end