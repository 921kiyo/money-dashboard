require('pg')
require_relative('../db/sql_runner')
require_relative('./transaction')

class User

  attr_reader(:id, :name, :email, :password)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @email = options['email']
    @password = options['password']
  end

  def save()
    sql = "INSERT INTO users (name, email, password) VALUES ('#{@name}', '#{@email}', '#{@password}') RETURNING *;"
    user = SqlRunner.run(sql).first
    @id = user['id']
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE user_id = #{@id} ORDER BY dates DESC;"
    Transaction.map_items(sql)
  end

  # def self.all()
  #   sql = "SELECT * FROM users;"
  #   User.map_items(sql)
  # end

  def self.find(id)
    sql = "SELECT * FROM users WHERE id = #{id};"
    User.map_item(sql)
  end

  def self.find_by(email, password)
    sql = "SELECT * FROM users WHERE email = '#{email}' AND password = '#{password}';"
    User.map_item(sql)
  end

  def self.update(options)
    sql = "UPDATE users SET
            name = '#{options['name']}',
            email = '#{options['email']}',
            password = '#{options['password']}'
            WHERE id = #{options['id']};"
    SqlRunner.run(sql)
  end

  # def self.delete(id)
  #   sql = "DELETE FROM users WHERE id = #{id};"
  #   SqlRunner.run(sql)
  # end

  def self.delete_all()
    sql = "DELETE FROM users;"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    users= SqlRunner.run(sql)
    result = users.map{|user| User.new(user)}
    return result
  end

  def self.map_item(sql)
    result = User.map_items(sql)
    return result.first
  end

end