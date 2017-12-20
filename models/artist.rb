require_relative("../db/sql_runner.rb")

class Artist
  attr_reader :id, :artist_name, :artist_profile, :artist_image
  attr_accessor :id

  def initialize options
    @id = options['id'].to_i if options['id']
    @artist_name = options['artist_name']
    @artist_profile = options['artist_profile']
    @artist_image = options['artist_image']
  end

  def save
    sql = "INSERT INTO artists (artist_name, artist_profile, artist_image)
          VALUES ($1,$2,$3)
          RETURNING id"
    values = [@artist_name, @artist_profile, @artist_image]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
  sql = "UPDATE artists
  SET
  (
    artist_name,
    artist_profile,
    artist_image
  ) =
  (
    $1, $2, $3
  )
  WHERE id = $4"
  values = [@artist_name, @artist_profile, @artist_image, @id]
  SqlRunner.run(sql, values)
end

  def self.all
    sql = "SELECT * FROM artists"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|artist| Artist.new(artist)}
  end

  def self.find
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



end
