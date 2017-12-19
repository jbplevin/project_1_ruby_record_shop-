require_relative("../db/sql_runner.rb")

class Stock

  attr_reader :id,
              :album_id,
              :album_quantity,
              :album_trade_price,
              :album_retail_price,
              :artist_id,
              :song_id,
              :song_quantity,
              :song_trade_price,
              :song_retail_price
  attr_accessor :id

  def initialize options
    @id = options['id'].to_i if options['id']
    @album_id = options['album_id'].to_i
    @album_quantity = options['album_quantity'].to_i
    @album_trade_price = options['album_trade_price'].to_f
    @album_retail_price = options['album_retail_price'].to_f
    @artist_id = options['artist_id'].to_i
    @song_id = options['song_id'].to_i
    @song_quantity = options ['song_id'].to_i
    @song_trade_price = options['song_trade_price'].to_f
    @song_retail_price = options['song_retail_price'].to_f
  end

  def save
    sql = "INSERT INTO stocks
          (
          album_id,
          album_quantity,
          album_trade_price,
          album_retail_price,
          artist_id,
          song_id,
          song_quantity,
          song_trade_price,
          song_retail_price
          )
          VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)
          RETURNING id"
    values = [
          @album_id,
          @album_quantity,
          @album_trade_price,
          @album_retail_price,
          @artist_id,
          @song_id,
          @song_quantity,
          @song_trade_price,
          @song_retail_price
          ]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM stocks"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|stock| Stock.new(stock)}
  end

  def self.find(id)
    sql = "SELECT * WHERE id = $1"
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
  



end
