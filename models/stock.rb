class Stock

  attr_reader
  attr_accessor

  def initialize options
    @id = options['id'].to_i if options['id']
    @album_id = options['album_id'].to_i
    @album_quantity = options['album_quantity'].to_i
    @album_price = options['album_price'].to_f
    @artist_id = options['artist_id'].to_i
    @song_id = options['song_id'].to_i
    @song_quantity = options ['song_id'].to_i
    @song_price = options['song_price'].to_f
  end

  def save
    sql = "INSERT INTO record_shop
          (
          album_id,
          album_quantity,
          album_price,
          artist_id,
          song_id,
          song_quantity,
          song_price
          )
          VALUES ($1,$2,$3,$4,$5,$6,$7)
          RETURNING id"
    values = [
          @album_id,
          @album_quantity,
          @album_price,
          @artist_id,
          @song_id,
          @song_quantity,
          @song_price
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

  def find
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
