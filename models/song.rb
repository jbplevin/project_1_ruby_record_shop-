class Song

  attr_reader :id, :title, :artist_id, :album_id, :length, :genre

  def initialize options
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @album_id = options['album_id'].to_i
    @length = options['length'].to_i
    @genre = options['genre']
  end

end
