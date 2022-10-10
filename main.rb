require('sinatra')
require('sinatra/flash')
require('pony')
require('sinatra/contrib/all')
require_relative('controllers/users_controller')
require_relative('controllers/categories_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/application_controller')
require_relative('controllers/contact_controller')


get '/' do
  @user = User.find(session[:id])  unless session[:id] == nil
  erb(:'/home')
end