class Stock

  attr_reader
  attr_accessor

  def initialize options
    @id = options['id'].to_i if options['id']
    @album_id = options['album_id'].to_i
    @album_quantity = options['album_quantity'].to_i
    @album_price = options['album_price'].to_f
    @artist_id = options['artist_id'].to_i
    @song_id = options['song_id'].to_i
    @song_quantity = options ['song_id'].to_i
    @song_price = options['song_price'].to_f
  end
end
