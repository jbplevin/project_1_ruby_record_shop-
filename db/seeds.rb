require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require_relative("../models/song.rb")
require_relative("../models/stock.rb")
require("pry-byebug")


Album.delete_all
Artist.delete_all
Song.delete_all
Stock.delete_all

artist1 = Artist.new({
  "artist_name" => "The Strokes",
  "artist_profile" => "New York based band featuring lead singer Julian Casablancas",
  "artist_image" => "users/Joe/images/record_shop/artists/the_strokes.jpg"
  })

artist2 = Artist.new({
  "artist_name" => "The Police",
  "artist_profile" => "Sting.",
  "artist_image" => "users/Joe/images/record_shop/artists/the_police.jpg"
  })

artist1.save
artist2.save

song1 = Song.new({
  "song_title" => "The Modern Age",
  "song_genre" => "Indie Rock",
  "song_length" => 3.32
  })
song2 = Song.new({
  "song_title" => "Does Everybody Stare",
  "song_genre" => "White Reggae",
  "song_length" => 3.21
  })
song3 = Song.new({
  "song_title" => "Walking on the moon",
  "song_genre" => "White Reggae",
  "song_length" => 3.12
  })
song4 = Song.new({
  "song_title" => "12.51",
  "song_genre" => "Indie Rock",
  "song_length" => 2.32
  })
song5 = Song.new({
  "song_title" => "Don't Stand So Close",
  "song_genre" => "White Reggae",
  "song_length" => 4.21
  })
song6 = Song.new({
  "song_title" => "Is This It?",
  "song_genre" => "Indie Rock",
  "song_length" => 3.54
  })
song7 = Song.new({
  "song_title" => "Soma",
  "song_genre" => "Indie Rock",
  "song_length" => 3.10
  })
song1.save()
song2.save()
song3.save()
song4.save()
song5.save()
song6.save()
song7.save()

album1 = Album.new({
  "album_type" => "CD",
  "artist_id" => artist1.id,
  "song_id" => song1.id,
  "album_genre" => "Indie Rock",
  "album_title" => "Is This It?",
  "album_cover" => "users/Joe/images/record_shop/albums/is_this_it.jpg",
  "album_tracklist" => "'Is This It?','The Modern Age', 'Soma'"
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
