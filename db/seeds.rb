require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require_relative("../models/song.rb")
require_relative("../models/stock.rb")
require("pry-byebug")


Album.delete_all()
Artist.delete_all()
Song.delete_all()


artist1 = Artist.new({
  "name" => "The Strokes",
  "profile" => "New York based band featuring lead singer Julian Casablancas",
  "image" => "users/Joe/images/record_shop/artists/the_strokes.jpg"
  })

artist1.save()

song1 = Song.new({
  "title" => "The Modern Age",
  "genre" => "Indie Rock",
  "length" => 03.32
  })
song1.save()

album1 = Album.new({
  "type" => "CD",
  "artist_id" => artist1.id,
  "song_id" => song1.id,
  "genre" => "Indie Rock",
  "title" => "Is This It?",
  "image" => "users/Joe/images/record_shop/albums/is_this_it.jpg",
  "tracklist" => "'Is This It?','The Modern Age', 'Soma'"
  })
album1.save()

stock1 = Stock.new({
    "album_id" => album1.id,
    "artist_id" => artist1.id,
    "song_id" => song1.id,
    "album_quantity" => 3,
    "album_trade_price" => 1.99,
    "album_retail_price" => 5.00,
    "song_quantity" => 12,
    "song_trade_price" => 0.10,
    "song_retail_price" => 0.99
    })
stock1.save()
