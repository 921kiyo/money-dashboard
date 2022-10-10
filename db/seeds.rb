require('pry-byebug')
require_relative('../models/user')
require_relative('../models/transaction')
require_relative('../models/category')
require_relative('../models/merchant')

User.delete_all()
Category.delete_all()
Transaction.delete_all()
Merchant.delete_all()

user1 = User.new({'name' => 'Kiyo', 'email' => 'user1@gmail.com', 'password' => 'user1'})
user2 = User.new({'name' => 'user2', 'email' => 'user2@gmail.com', 'password' => 'user2'})
user3 = User.new({'name' => 'user3', 'email' => 'user3@gmail.com', 'password' => 'user3'})
user4 = User.new({'name' => 'user4', 'email' => 'user4@gmail.com', 'password' => 'user4'})

user1.save
user2.save
user3.save
user4.save

food = Category.new('category_name' => 'Food')
daily_goods = Category.new('category_name' => 'Daily goods')
transport = Category.new('category_name' => 'Transport')
socializing = Category.new('category_name' => 'Socializing')
hobbies = Category.new('category_name' => 'Hobbies')
education = Category.new('category_name' => 'Education')
fashion = Category.new('category_name' => 'Fashion')
medical = Category.new('category_name' => 'Medical')
phone_internet = Category.new('category_name' => 'Phone, Internet')
utilities = Category.new('category_name' => 'Utilities')
home = Category.new('category_name' => 'Home')
automobile = Category.new('category_name' => 'Automobile')
taxes = Category.new('category_name' => 'Taxes')
big_outlay = Category.new('category_name' => 'Big outlay')
other = Category.new('category_name' => 'Other')

food.save
daily_goods.save
transport.save
socializing.save
hobbies.save
education.save
fashion.save
medical.save
phone_internet.save
utilities.save
home.save
automobile.save
taxes.save
big_outlay.save
other.save

tesco = Merchant.new('merchant_name' => 'Tesco')
boots = Merchant.new('merchant_name' => 'Boots')
sainsbary = Merchant.new('merchant_name' => 'Sainsbary')
hmsmith = Merchant.new('merchant_name' => 'HM Smith')
primark = Merchant.new('merchant_name' => 'Primark')
easyjet = Merchant.new('merchant_name' => 'EasyJet')
amazon = Merchant.new('merchant_name' => 'Amazon')
restaurant = Merchant.new('merchant_name' => 'Restaurant')
scot_rail = Merchant.new('merchant_name' => 'ScotRail')

tesco.save
boots.save
sainsbary.save
hmsmith.save
primark.save
easyjet.save
amazon.save
restaurant.save
scot_rail.save

transaction1 = Transaction.new('amount' => 12, 'memo' => 'lots of veggies, dairy products, olive oil etc', 'dates' => '07-10-2016', 'user_id' => user1.id, 'category_id' => food.id, 'merchant_id' =>tesco.id)
transaction2 = Transaction.new('amount' => 9, 'memo' => 'Toilet paper, shampoo, suncream', 'dates' => '07-11-2016', 'user_id' => user1.id, 'category_id' => daily_goods.id, 'merchant_id' =>boots.id)
transaction3 = Transaction.new('amount' => 60, 'memo' => 'Flight ticket to London', 'dates' => '07-09-2016', 'user_id' => user1.id, 'category_id' => transport.id, 'merchant_id' =>easyjet.id)
transaction4 = Transaction.new('amount' => 200, 'memo' => 'Italian restaurant in London, Archer St.', 'dates' => '07-09-2016', 'user_id' => user1.id, 'category_id' => socializing.id, 'merchant_id' =>restaurant.id)
transaction5 = Transaction.new('amount' => 25, 'memo' => 'Souvenir', 'dates' => '07-10-2016', 'user_id' => user1.id, 'category_id' => socializing.id, 'merchant_id' =>hmsmith.id)
transaction6 = Transaction.new('amount' => 260, 'memo' => 'New smartphone, Galaxy S6', 'dates' => '08-14-2016', 'user_id' => user1.id, 'category_id' => other.id, 'merchant_id' =>amazon.id)
transaction7 = Transaction.new('amount' => 35, 'memo' => 'Drone(Syma X8G 2.4g 4ch 6 Axis Headless Gyro RTF RC Drone Quadcopter With 8MP 1080P HD Camera)', 'dates' => '08-15-2016', 'user_id' => user1.id, 'category_id' => other.id, 'merchant_id' =>amazon.id)
transaction8 = Transaction.new('amount' => 800, 'memo' => '3D printer(Flashforge® 3D Printer Creator Pro Dual Extruder Printer with Optimized Build Plate and Upgraded Spool Holder)', 'dates' => '08-15-2016', 'user_id' => user1.id, 'category_id' => other.id, 'merchant_id' =>amazon.id)
transaction9 = Transaction.new('amount' => 60, 'memo' => 'French restaurant in Grassmarket', 'dates' => '08-16-2016', 'user_id' => user1.id, 'category_id' => socializing.id, 'merchant_id' =>restaurant.id)
transaction10 = Transaction.new('amount' => 8, 'memo' => 'Train to Glasgow, meeting up with my old friend', 'dates' => '08-17-2016', 'user_id' => user1.id, 'category_id' => transport.id, 'merchant_id' =>scot_rail.id)
transaction11 = Transaction.new('amount' => 100, 'memo' => 'Socializing', 'dates' => '08-18-2016', 'user_id' => user2.id, 'category_id' => socializing.id, 'merchant_id' =>tesco.id)
transaction12 = Transaction.new('amount' => 100, 'memo' => 'Socializing', 'dates' => '08-18-2016', 'user_id' => user2.id, 'category_id' => socializing.id, 'merchant_id' =>tesco.id)

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save
transaction7.save
transaction8.save
transaction9.save
transaction10.save
transaction11.save
transaction12.save

binding.pry
nil