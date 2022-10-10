require('minitest/autorun')
require('minitest/rg')
require_relative('../models/user')
require_relative('../models/transaction')
require_relative('../models/category')
require_relative('../models/analysis')

class TestAnalysis < Minitest::Test
  def setup
    # Setup dummy data for testing purpose

    user1 = User.new({'id' => 1, 'name' => 'user1', 'email' => 'user1@gmail.com', 'password' => 'user1'})

    food = Category.new({'id' => 1,'category_name' => 'Food'})
    daily_goods = Category.new({'id' => 2,'category_name' => 'Daily goods'})
    transport = Category.new({'id' => 3,'category_name' => 'Transport'})

    tesco = Merchant.new({'id' => 1,'merchant_name' => 'Tesco'})
    boots = Merchant.new({'id' => 2,'merchant_name' => 'Boots'})
    sainsbary = Merchant.new({'id' => 3,'merchant_name' => 'Sainsbary'})

    transaction1 = Transaction.new({'id' => 1,'amount' => 10, 'memo' => 'dummy data1', 'dates' => '07-10-2016', 'user_id' => user1.id, 'category_id' => food.id, 'merchant_id' =>tesco.id})
    transaction2 = Transaction.new({'id' => 2,'amount' => 20, 'memo' => 'dummy data2', 'dates' => '07-11-2016', 'user_id' => user1.id, 'category_id' => food.id, 'merchant_id' =>tesco.id})
    transaction3 = Transaction.new({'id' => 3,'amount' => 30, 'memo' => 'dummy data3', 'dates' => '07-12-2016', 'user_id' => user1.id, 'category_id' => daily_goods.id, 'merchant_id' =>boots.id})

    @transactions = [transaction1, transaction2, transaction3]
    @analysis = Analysis.new(@transactions)

  end

  def test_total_expenditure
    result = @analysis.total_expenditure
    assert_equal(60, result)
  end

  def test_filter_by_category
    result = @analysis.filter_by_category(1)
    assert_equal(1, result[0].category_id)
    assert_equal(1, result[1].category_id)
  end

  def test_filter_by_merchant
    result = @analysis.filter_by_category(1)
    assert_equal(1, result[0].merchant_id)
    assert_equal(1, result[1].merchant_id)
  end

  def test_filter_by_date
    result = @analysis.filter_by_date('07-10-2016', '07-11-2016')
    assert_equal(1, result[0].id)
    assert_equal(2, result[1].id)
  end

  def test_total
    result = @analysis.total
    assert_equal(60, result)
  end

  def test_percent
    result = @analysis.percent(60)
    assert_equal(100, result)
  end

end