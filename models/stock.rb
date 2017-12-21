require_relative("../db/sql_runner.rb")

class Stock

  attr_reader :id,
              :album_id,
              :quantity
  attr_accessor :id

  def initialize options
    @id = options['id'].to_i if options['id']
    @album_id = options['album_id'].to_i
    @quantity = options['quantity'].to_i
  end

  def save
    sql = "INSERT INTO stocks
          (
          album_id,
          quantity
          )
          VALUES ($1,$2)
          RETURNING id"
    values = [
          @album_id,
          @quantity
          ]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end
  def update
  sql = "UPDATE stocks
  SET
  (
    album_id,
    quantity
  ) =
  (
    $1, $2
  )
  WHERE id = $3"
  values = [
        @album_id,
        @quantity
        ]
  SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM stocks"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|stock| Stock.new(stock)}
  end

  def self.find(id)
    sql = "SELECT * FROM stocks WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Stock.new(results[0])
  end

  def self.delete_all
    sql = "DELETE FROM stocks"
    values = []
    SqlRunner.run(sql, values)
  end

  def destory(id)
    sql = "DELETE FROM stocks WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def album()
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@album_id]
    results = SqlRunner.run(sql, values)
    return Album.new(results[0])
  end

end
