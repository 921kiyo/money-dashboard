 require('pg')
require_relative('../db/sql_runner')
require_relative('./transaction')

class Merchant
  attr_reader(:id, :merchant_name)
  def initialize(options)
    @id = options['id'].to_i
    @merchant_name = options['merchant_name']
  end

  def save()
    sql = "INSERT INTO merchants (merchant_name) VALUES ('#{@merchant_name}') RETURNING *;"
    merchant = SqlRunner.run(sql).first
    @id = merchant['id']
  end

  def self.all()
    sql = "SELECT * FROM merchants;"
    Merchant.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = #{id};"
    Merchant.map_item(sql)
  end

  # def self.update(options)
  #   sql = "UPDATE merchants SET
  #         merchant_name = '#{options['merchant_name']}'
  #         WHERE id = #{options['id']};"
  #   SqlRunner.run(sql)
  # end

  def self.delete(id)
    sql = "DELETE FROM merchants WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    merchants = SqlRunner.run(sql)
    result = merchants.map {|merchant| Merchant.new(merchant)}
    return result
  end

  def self.map_item(sql)
    result = Merchant.map_items(sql)
    return result.first
  end

end