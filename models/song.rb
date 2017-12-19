require_relative("../db/sql_runner.rb")

class Song

  attr_reader :id, :title, :artist_id, :album_id, :length, :genre

  def initialize options
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @length = options['length'].to_i
    @genre = options['genre']
  end

  def save
    sql = "INSERT INTO songs
          (
          title,
          length,
          genre
          )
          VALUES ($1,$2,$3)
          RETURNING id"
    values = [
          @title,
          @length,
          @genre
          ]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM songs"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|song| Song.new(song)}
  end

  def self.find
    sql = "SELECT * WHERE id = $1"
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

end
