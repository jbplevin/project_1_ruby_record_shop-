DROP TABLE stocks;
DROP TABLE songs;
DROP TABLE albums;
DROP TABLE artists;


CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  bio VARCHAR(255),
  image VARCHAR(255)
);
CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  artist_id INT8 REFERENCES artists(id),
  type VARCHAR(255),
  genre VARCHAR(255),
  title VARCHAR(255),
  cover_image VARCHAR(255)
);
CREATE TABLE songs
(
  id SERIAL8 PRIMARY KEY,
  album_id INT8 REFERENCES albums(id),
  title VARCHAR(255) NOT NULL,
  length FLOAT(2),
  genre VARCHAR(255) NOT NULL
);

CREATE TABLE stocks (
  id SERIAL8 PRIMARY KEY,
  album_id INT8 REFERENCES albums(id),
  quantity INT8
);
