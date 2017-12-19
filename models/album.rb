require_relative("../db/sql_runner.rb")

class Album

  attr_reader :id, :type, :genre, :title, :image, :tracklist

  def initialize options
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
    @song_id = options['song_id'].to_i
    @type = options['type']
    @genre = options['genre']
    @title = options['title']
    @image = options['image']
    @tracklist = options['tracklist']
  end

  def save
    sql = "INSERT INTO albums (artist_id, song_id, type, genre, title, image, tracklist)
          VALUES ($1,$2,$3,$4,$5,$6,$7)
          RETURNING id"
    values = [
              @artist_id,
              @song_id,
              @type,
              @genre,
              @title,
              @image,
              @tracklist
            ]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|album| Album.new(album)}
  end

  def self.find
    sql = "SELECT * WHERE id = $1"
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


end
