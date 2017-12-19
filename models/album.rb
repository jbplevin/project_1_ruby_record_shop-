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
end
