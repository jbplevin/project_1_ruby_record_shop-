DROP TABLE stocks;
DROP TABLE albums;
DROP TABLE artists;
DROP TABLE songs;

CREATE TABLE songs
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  length TIME,
  genre VARCHAR(255) NOT NULL
);
CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  profile VARCHAR(255),
  image VARCHAR(255)
);
CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY
  artist_id INT8 REFERENCES artists(id)
  song_id INT8 REFERENCES songs(id)
  type VARCHAR(255)
  genre VARCHAR(255)
  title VARCHAR(255)
  image VARCHAR(255)
  tracklist VARCHAR(255)
);
CREATE TABLE stocks (
  id SERIAL8 PRIMARY KEY
  album_id INT8 REFERENCES albums(id)
  album_quantity INT8
  album_retail_price FLOAT
  album_trade_price FLOAT
  artist_id INT8 REFERENCES artists(id)
  song_id INT8 REFERENCES songs(id)
  song_trade_price FLOAT
  song_retail_price FLOAT
  song_quantity INT8
);
