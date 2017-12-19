class Artist
  attr_reader :id, :name, :profile

  def initialize options
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @profile = options['profile']
    @image = options['image']
  end

  def save
    sql = "INSERT INTO record_shop (name, profile, image)
          VALUES ($1,$2,$3)
          RETURNING id"
    values = [@name, @profile, @image]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM artists"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|artist| Artist.new(artist)}
  end

  def self.find
    sql = "SELECT * WHERE id = $1"
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
