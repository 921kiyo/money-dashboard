require('pg')
require_relative('../db/sql_runner')
require_relative('./user')
require_relative('./merchant')
require_relative('./category')

class Transaction
  
  attr_reader(:id, :amount, :memo, :dates, :user_id, :category_id, :merchant_id)

  def initialize(options)
    @id = options['id'].to_i
    @amount = options['amount'].to_i
    @memo = options['memo']
    @dates = options['dates'] 
    @user_id = options['user_id'].to_i
    @category_id = options['category_id'].to_i
    @merchant_id = options['merchant_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions (amount, memo, dates, user_id, category_id, merchant_id)
          VALUES ('#{@amount}', '#{memo}', '#{dates}', '#{user_id}', '#{category_id}', '#{merchant_id}') RETURNING *;"
    transaction = SqlRunner.run(sql).first
    @id = transaction['id'] 
  end

  def category
    sql = "SELECT * FROM categories WHERE id = #{@category_id};"
    Category.map_item(sql)
  end

  def merchant
    sql = "SELECT * FROM merchants WHERE id = #{@merchant_id};"
    Merchant.map_item(sql)
  end

  # def self.all()
  #   sql = "SELECT * FROM transactions;"
  #   Transaction.map_items(sql)
  # end # Probably not necessary

  def self.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id};"
    Transaction.map_item(sql)
  end

  def self.update(options) ## amount '' necessary?
    sql = "UPDATE transactions SET
            amount = #{options['amount']},
            memo = '#{options['memo']}',
            dates = '#{options['dates']}',
            user_id = #{options['user_id']},
            category_id = #{options['category_id']},
            merchant_id = #{options['merchant_id']}
            WHERE id = #{options['id']};"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM transactions WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def self.map_items(sql) ## Can I use this in user class as well?
    transactions= SqlRunner.run(sql)
    result = transactions.map{|transaction| Transaction.new(transaction)}
    return result
  end

  def self.map_item(sql)
    result = Transaction.map_items(sql)
    return result.first
  end
end