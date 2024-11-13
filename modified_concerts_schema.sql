CREATE TABLE artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(128),
    genre VARCHAR(64),
    debut_year YEAR
);

CREATE TABLE albums (
    album_id INT PRIMARY KEY,
    album_title VARCHAR(256),
    release_date DATE
);

-- Linking table artists and albums to support multiple artists per album
CREATE TABLE artist_albums_link (
    artist_id INT,
    album_id INT,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(128),
    length REAL,
    release_date DATE
);

-- Linking table artists and songs to support multiple artists per song
CREATE TABLE artists_songs_link (
    artist_id INT,
    song_id INT,
    PRIMARY KEY (artist_id, song_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE concerts (
    concert_id INT PRIMARY KEY,
    concert_title VARCHAR(256),
    location VARCHAR(256),
    date_of_concert DATE
);

-- Linking table artists and concerts to support multiple artists per consert
CREATE TABLE artist_concerts_link (
    artist_id INT,
    concert_id INT,
    PRIMARY KEY (artist_id, concert_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (concert_id) REFERENCES concerts(concert_id)
);

-- Linking table concerts and songs to support multiple songs per concert
CREATE TABLE concerts_songs_link (
    concert_id INT,
    song_id INT,
    order_performance TINYINT,
    PRIMARY KEY (concert_id, song_id),
    FOREIGN KEY (concert_id) REFERENCES concerts(concert_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE fans (
    fan_id INT PRIMARY KEY,
    fan_name VARCHAR(128),
    fan_email VARCHAR(128) UNIQUE,
    age TINYINT
);

-- Favorite artists per table
CREATE TABLE fan_favorites (
    fan_id INT,
    artist_id INT,
    PRIMARY KEY (fan_id, artist_id),
    FOREIGN KEY (fan_id) REFERENCES fans(fan_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE concerts_tickets (
    ticket_id INT PRIMARY KEY,
    concert_id INT,
    purchase_date DATE,
    ticket_price DOUBLE,
    seat_zone VARCHAR(16),
    seat_number VARCHAR(16),
    FOREIGN KEY (concert_id) REFERENCES concerts(concert_id)
);

-- Linking table fans and tickets to support multiple fans per ticket
CREATE TABLE fan_tickets_link (
    fan_id INT,
    ticket_id INT,
    PRIMARY KEY (fan_id, ticket_id),
    FOREIGN KEY (fan_id) REFERENCES fans(fan_id),
    FOREIGN KEY (ticket_id) REFERENCES concerts_tickets(ticket_id)
);
