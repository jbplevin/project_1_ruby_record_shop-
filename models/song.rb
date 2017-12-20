require_relative("../db/sql_runner.rb")

class Song

  attr_reader :id, :song_title, :song_length, :song_genre
  attr_accessor :id
  def initialize options
    @id = options['id'].to_i if options['id']
    @song_title = options['song_title']
    @song_length = options['song_length'].to_f
    @song_genre = options['song_genre']
  end

  def save
    sql = "INSERT INTO songs
          (
          song_title,
          song_length,
          song_genre
          )
          VALUES ($1,$2,$3)
          RETURNING id"
    values = [
          @song_title,
          @song_length,
          @song_genre
          ]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
  sql = "UPDATE songs
  SET
  (
    song_title,
    song_length,
    song_genre
  ) =
  (
    $1, $2, $3
  )
  WHERE id = $4"
  values = [@song_title, @song_length, @song_genre]
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

end
