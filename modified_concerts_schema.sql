CREATE TABLE artists (
  artist_id INTEGER(10) PRIMARY KEY,
  artist_name VARCHAR(128),
  genre VARCHAR(64),
  debut_year YEAR
);

-- Linking table artists and albums for multiple artists per album
CREATE TABLE artists_albums_link (
    artist_id INT,
    album_id INT,
    PRIMARY KEY(artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);


CREATE TABLE albums (
  album_id INTEGER(10) PRIMARY KEY,
  album_title VARCHAR(256),
  release_date DATE
);

-- Linking table artist and songs for multiple artists per song
CREATE TABLE artists_songs_link (
    artist_id INT,
    song_id INT,
    PRIMARY KEY (artist_id, song_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE songs (
  song_id INTEGER(10) PRIMARY KEY,
  album_id INTEGER(10),
  song_title VARCHAR(128),
  length REAL,
  release_date DATE,
  FOREIGN KEY (album_id) REFERENCES albums(album_id)
);


CREATE TABLE concerts (
  concert_id INTEGER(10) PRIMARY KEY,
  concert_title VARCHAR(256),
  location VARCHAR(256),
  date_of_concert DATE
);

CREATE TABLE concerts_songs_link (
  concert_id INTEGER(10),
  song_id INTEGER(10),
  order_performance TINYINT(4),
  PRIMARY KEY (concert_id, song_id),
  FOREIGN KEY (concert_id) REFERENCES concerts(concert_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE concerts_tickets_link (
  ticket_id INTEGER(10) PRIMARY KEY,
  concert_id INTEGER(10),
  favourite_artist_id INTEGER(10),
  purchase_date DATE,
  ticket_price DOUBLE,
  seat_zone  VARCHAR(16),
  seat_number VARCHAR(16),
);

CREATE TABLE fans (
  fan_id INTEGER(10) PRIMARY KEY,
  fan_name VARCHAR(128),
  fan_email VARCHAR(128),
  age TINYINT(3),
  ticket_id INTEGER(10)
)

CREATE TABLE fans_favorite_artists (
  fan_id INTEGER(10),
  artist_id INTEGER(10),
  PRIMARY KEY (fan_id, ticket_id),
  FOREIGN KEY (fan_id) REFERENCES fans(fan_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
)