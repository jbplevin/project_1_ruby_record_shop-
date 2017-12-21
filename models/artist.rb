require_relative("../db/sql_runner.rb")
class Artist
  attr_reader :id, :name, :bio, :image
  attr_accessor :id

  def initialize options
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @bio = options['bio']
    @image = options['image']
  end

  def save
    sql = "INSERT INTO artists (name, bio, image)
          VALUES ($1,$2,$3)
          RETURNING id"
    values = [@name, @bio, @image]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE artists
    SET
    (
      name,
      bio,
      image
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @bio, @image, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM artists"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|artist| Artist.new(artist)}
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Artist.new(results[0])
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    values = []
    SqlRunner.run(sql, values)
  end

  def destory(id)
    sql = "DELETE FROM artists WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def songs
    sql = "SELECT *
          FROM albums
          INNER JOIN songs ON songs.album_id = albums.id
          WHERE songs.artist_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    results.map{|album| album['title'] }
  end

  def albums
    sql = "SELECT *
          FROM songs
          INNER JOIN albums ON albums.artist_id = songs.id
          WHERE albums.artist_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    results.map{|album| album['title'] }
  end




end
