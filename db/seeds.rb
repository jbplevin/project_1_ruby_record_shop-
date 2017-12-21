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
  "bio" => "American rock band formed in New York in 1998.",
  "image" => "/media/images/artists/the_strokes.jpeg"
  })

artist2 = Artist.new({
  "name" => "The Police",
  "bio" => "English rock band formed in London, England in 1977",
  "image" => "/media/images/artists/the_police.jpeg"
  })
artist3 = Artist.new({
  "name" => "Led Zeppelin",
  "bio" => "English rock band formed in London in 1968.",
  "image" => "/media/images/artists/led_zeppelin.jpeg"
  })
artist4 = Artist.new({
  "name" => "The Zutons",
  "bio" => "English indie rock band, formed in 2001 in Liverpool.",
  "image" => "/media/images/artists/the_zutons.jpg"
  })

artist5 = Artist.new({
  "name" => "Chaka Khan",
  "bio" => "American artist whose career began in the 1970s.",
  "image" => "/media/images/artists/chaka_khan.jpg"
  })

artist6 = Artist.new({
  "name" => "Thelma Houston",
  "bio" => "American singer and actress",
  "image" => "/media/images/artists/thelma_houston.jpg"
  })


artist1.save
artist2.save
artist3.save
artist4.save
artist5.save
artist6.save


album1 = Album.new({
  "type" => "CD",
  "artist_id" => artist1.id,
  "genre" => "00s Rock",
  "title" => "Is This It?",
  "cover_image" => "/media/images/albums/is_this_it.jpg"
  })

album2 = Album.new({
  "type" => "Vinyl",
  "artist_id" => artist2.id,
  "genre" => "80s Rock",
  "title" => "Regatta de Blanc",
  "cover_image" => "/media/images/albums/regatta_de_blanc.jpg"
  })
album3 = Album.new({
  "type" => "Minidisc",
  "artist_id" => artist1.id,
  "genre" => "00s Rock",
  "title" => "Room On Fire",
  "cover_image" => "/media/images/albums/room_on_fire.jpg"
  })
album4 = Album.new({
  "type" => "Vinyl",
  "artist_id" => artist6.id,
  "genre" => "Motown",
  "title" => "Mowest",
  "cover_image" => "/media/images/albums/mowest.jpg"
  })
album5 = Album.new({
  "type" => "Vinyl",
  "artist_id" => artist6.id,
  "genre" => "Motown",
  "title" => "Sunshower",
  "cover_image" => "/media/images/albums/sunshower.jpg"
  })
album6 = Album.new({
  "type" => "Vinyl",
  "artist_id" => artist3.id,
  "genre" => "60s Rock",
  "title" => "Led Zeppelin",
  "cover_image" => "/media/images/albums/led_zep_1.jpg"
  })
album7 = Album.new({
  "type" => "CD",
  "artist_id" => artist3.id,
  "genre" => "60s Rock",
  "title" => "II",
  "cover_image" => "/media/images/albums/led_zep_2.jpg"
  })
album8 = Album.new({
  "type" => "Vinyl",
  "artist_id" => artist3.id,
  "genre" => "70s Rock",
  "title" => "III",
  "cover_image" => "/media/images/albums/led_zep_3.jpg"
  })
album9 = Album.new({
  "type" => "Vinyl",
  "artist_id" => artist3.id,
  "genre" => "70s Rock",
  "title" => "IV",
  "cover_image" => "/media/images/albums/led_zep_4.jpg"
  })
album10 = Album.new({
  "type" => "Minidisc",
  "artist_id" => artist4.id,
  "genre" => "00s Rock",
  "title" => "Who Killed The Zutons?",
  "cover_image" => "/media/images/albums/who_killed.jpg"
  })
album11 = Album.new({
  "type" => "Vinyl",
  "artist_id" => artist5.id,
  "genre" => "Pop",
  "title" => "Regatta de Blanc",
  "cover_image" => "/media/images/albums/what_cha_gonna_do.jpg"
  })

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()
album7.save()
album8.save()
album9.save()


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
