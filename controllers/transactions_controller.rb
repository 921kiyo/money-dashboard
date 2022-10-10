require_relative('../models/transaction')
require_relative('../models/user')
require_relative('../models/category')
require("pry-byebug")

require_relative('./application_controller')

before '/transactions' do
  require_user
end
before '/transactions/*' do
  require_user
end

#Index
get '/transactions' do
  @transactions = Transaction.all()
  erb(:'transactions/index')
end #Probably not necessary

#New
get '/transactions/new' do
  @current_user = current_user()
  @categories = Category.all()
  @merchants = Merchant.all()
  @transactions = @current_user.transactions()
  @analysis = Analysis.new( @transactions )
  @user = User.find(@current_user.id)
  erb(:'transactions/new')
end

#Create
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  flash[:notice] = "New transaction added!"
  redirect(to("/users/index"))
end

#Show in analysis page
get '/transactions/analysis' do
  @current_user = current_user()
  @transactions = @current_user.transactions()
  @analysis = Analysis.new( @transactions )
  @total = @analysis.total
  # binding.pry
  # @transactions = @analysis.percent(@total)
  erb(:'/transactions/analysis')
end

#Edit
get '/transactions/:id/edit' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @transaction = Transaction.find(params[:id])
  erb(:'transactions/edit')
end

#Update
post '/transactions/:id' do
  @transaction = Transaction.update(params)
  flash[:notice] = "Transaction updated!"
  redirect(to("/users/index"))
end

#Delete
post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  flash[:notice] = "Transaction deleted!"
  redirect(to("/users/index"))
end


