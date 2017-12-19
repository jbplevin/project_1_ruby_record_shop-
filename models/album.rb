class Album

  attr_reader :id, :type, :genre, :title, :image, :tracklist

  def initialize options
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @genre = options['genre']
    @title = options['title']
    @image = options['image']
    @tracklist = options['tracklist']
  end

  def save
    sql = "INSERT INTO record_shop (type, genre, title, image, tracklist)
          VALUES ($1,$2,$3,$4,$5)
          RETURNING id"
    values = @type, @genre, @title, @image, @tracklist
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    values = []
    results = SqlRunner.run(values, results)
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
