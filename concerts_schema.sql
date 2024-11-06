CREATE TABLE artists (
  artist_id INTEGER(10),
  artist_name VARCHAR(128),
  genre VARCHAR(64),
  debut_year YEAR
);

CREATE TABLE albums (
  album_id INTEGER(10),
  artist_id INTEGER(10),
  album_title VARCHAR(256),
  release_date DATE
);

CREATE TABLE songs (
  song_id INTEGER(10),
  album_id INTEGER(10),
  song_title VARCHAR(128),
  length REAL,
  release_date DATE
);

CREATE TABLE concerts (
  concert_id INTEGER(10),
  artist_id INTEGER(10),
  concert_title VARCHAR(256),
  location VARCHAR(256),
  date_of_concert DATE
);

CREATE TABLE concert_songs (
  concert_id INTEGER(10),
  song_id INTEGER(10),
  order_performance TINYINT(4)
);

CREATE TABLE concert_tickets (
  ticket_id INTEGER(10),
  concert_id INTEGER(10),
  fan_id INTEGER(10),
  fan_name VARCHAR(128),
  fan_email VARCHAR(128),
  age TINYINT(3),
  favourite_artist_id INTEGER(10),
  purchase_date DATE,
  ticket_price DOUBLE,
  seat_zone  VARCHAR(16),
  seat_number VARCHAR(16)
);