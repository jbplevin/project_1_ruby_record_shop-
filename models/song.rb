require_relative("../db/sql_runner.rb")

class Song

  attr_reader :id, :title, :album_id, :length, :genre
  attr_accessor :id
  def initialize options
    @id = options['id'].to_i if options['id']
    @album_id = options['album_id']
    @title = options['title']
    @length = options['length'].to_i # should turn into seconds
    @genre = options['genre']
  end

  def save
    sql = "INSERT INTO songs
          (
          album_id,
          title,
          length,
          genre
          )
          VALUES ($1,$2,$3,$4)
          RETURNING id"
    values = [
          @album_id,
          @title,
          @length,
          @genre
          ]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
  sql = "UPDATE songs
  SET
  (
    album_id,
    title,
    length,
    genre
  ) =
  (
    $1, $2, $3, $4
  )
  WHERE id = $5"
  values = [@album_id, @title, @length, @genre]
  SqlRunner.run(sql, values)
end

  def self.all
    sql = "SELECT * FROM songs"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|song| Song.new(song)}
  end

  def self.find
    sql = "SELECT * FROM songs WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Song.new(results[0])
  end

  def self.delete_all
    sql = "DELETE FROM songs"
    values = []
    SqlRunner.run(sql, values)
  end

  def destory(id)
    sql = "DELETE FROM songs WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def album
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@album_id]
    result = SqlRunner.run(sql, values)
    return Album.new(result[0])
  end

end
