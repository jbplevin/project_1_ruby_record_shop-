require_relative("../db/sql_runner.rb")

class Album

  attr_reader :id,
              :artist_id,
              :type,
              :genre,
              :title,
              :cover_image,
              :quantity,
              :trade_price,
              :retail_price

  attr_accessor :id

  def initialize options
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
    @type = options['type']
    @genre = options['genre']
    @title = options['title']
    @cover_image = options['cover_image']
    @quantity = options['quantity']
    @trade_price = options['trade_price']
    @retail_price = options['retail_price']
  end

  def save
    sql = "INSERT INTO albums (artist_id,
                               type,
                               genre,
                               title,
                               cover_image,
                               quantity,
                               trade_price,
                               retail_price
                              )
          VALUES ($1,$2,$3,$4,$5,$6,$7)
          RETURNING id"
    values = [
              @artist_id,
              @type,
              @genre,
              @title,
              @cover_image,
              @quantity,
              @trade_price,
              @retail_price
            ]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update
  sql = "UPDATE albums
  SET
  (
    artist_id,
    type,
    genre,
    title,
    cover_image,
    quantity,
    trade_price,
    retail_price
  ) =
  (
    $1, $2, $3, $4, $5, $6, $7
  )
  WHERE id = $6"
  values = [
    @artist_id,
    @type,
    @genre,
    @title,
    @cover_image,
    @quantity,
    @trade_price,
    @retail_price,
    @id
  ]
  SqlRunner.run(sql, values)
end

  def self.all
    sql = "SELECT * FROM albums"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|album| Album.new(album)}
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Album.new(results[0])
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    values = []
    SqlRunner.run(sql, values)
  end

  def destory(id)
    sql = "DELETE FROM albums WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def tracklist
    sql = "SELECT * FROM songs WHERE album_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|result| result['title']}
  end

  def profit_margin
    return @album['retail_price'] - @album['trade_price']
  end

end
