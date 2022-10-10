require('pg')
require_relative('../db/sql_runner')
require_relative('./transaction')

class Category
  attr_reader(:id, :category_name)
  def initialize(options)
    @id = options['id'].to_i
    @category_name = options['category_name']
  end

  def save()
    sql = "INSERT INTO categories (category_name) VALUES ('#{@category_name}') RETURNING *;"
    category = SqlRunner.run(sql).first
    @id = category['id']
  end

  def self.all()
    sql = "SELECT * FROM categories;"
    Category.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM categories;"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM categories WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    categories= SqlRunner.run(sql)
    result = categories.map{|category| Category.new(category)}
    return result
  end

  def self.map_item(sql)
    result = Category.map_items(sql)
    return result.first
  end

end