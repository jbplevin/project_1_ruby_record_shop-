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
  "name" => "The Strokes",
  "bio" => "New York based band featuring lead singer Julian Casablancas",
  "image" => "users/Joe/images/record_shop/artists/the_strokes.jpg"
  })

artist2 = Artist.new({
  "name" => "The Police",
  "bio" => "Sting.",
  "image" => "users/Joe/images/record_shop/artists/the_police.jpg"
  })

artist1.save
artist2.save


album1 = Album.new({
  "type" => "CD",
  "artist_id" => artist1.id,
  "genre" => "Indie Rock",
  "title" => "Is This It?",
  "cover_image" => "users/Joe/images/record_shop/albums/is_this_it.jpg"
  })

album2 = Album.new({
  "type" => "Vinyl",
  "artist_id" => artist2.id,
  "genre" => "White Reggae",
  "title" => "Regatta de Blanc",
  "cover_image" => "users/Joe/images/record_shop/albums/regatta_de_blanc.jpg"
  })
album1.save()
album2.save()


song1 = Song.new({
  "album_id" => album1.id,
  "artist_id" => artist1.id,
  "title" => "The Modern Age",
  "genre" => "Indie Rock",
  "length" => 3.32
  })
song2 = Song.new({
  "album_id" => album2.id,
  "artist_id" => artist2.id,
  "title" => "Does Everybody Stare",
  "genre" => "White Reggae",
  "length" => 3.21
  })
song3 = Song.new({
  "album_id" => album2.id,
  "artist_id" => artist2.id,
  "title" => "Walking on the moon",
  "genre" => "White Reggae",
  "length" => 3.12
  })
song4 = Song.new({
  "album_id" => album1.id,
  "artist_id" => artist1.id,
  "title" => "12.51",
  "genre" => "Indie Rock",
  "length" => 2.32
  })
song5 = Song.new({
  "album_id" => album2.id,
  "artist_id" => artist2.id,
  "title" => "Don't Stand So Close",
  "genre" => "White Reggae",
  "length" => 4.21
  })
song6 = Song.new({
  "album_id" => album1.id,
  "artist_id" => artist1.id,
  "title" => "Is This It?",
  "genre" => "Indie Rock",
  "length" => 3.54
  })
song7 = Song.new({
  "album_id" => album1.id,
  "artist_id" => artist1.id,
  "title" => "Soma",
  "genre" => "Indie Rock",
  "length" => 3.10
  })
song1.save()
song2.save()
song3.save()
song4.save()
song5.save()
song6.save()
song7.save()

stock1 = Stock.new({
    "album_id" => album1.id,
    "quantity" => 3
    })
stock1.save()
