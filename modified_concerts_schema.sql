-- -------------------------------- --
-- ARTISTS, ALBUMS AND SONGS TABLES --
-- -------------------------------- --
CREATE TABLE artists (
    artist_id  INTEGER(10) PRIMARY KEY,
    artist_name VARCHAR(128),
    genre VARCHAR(64),
    debut_year YEAR
);

CREATE TABLE albums (
    album_id  INTEGER(10) PRIMARY KEY,
    album_title VARCHAR(256),
    release_date DATE
);

CREATE TABLE songs (
    song_id  INTEGER(10) PRIMARY KEY,
    song_title VARCHAR(128),
    length REAL,
    release_date DATE
);

-- Linking tables artists, albums and songs to support multiple albums per song, multiple artist per song, multiple songs and albums per artist
CREATE TABLE artist_album_song_link (
    artist_id  INTEGER(10),
    album_id  INTEGER(10),
    song_id  INTEGER(10),
    PRIMARY KEY (artist_id, album_id, song_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

-- -------------- --
-- CONCERTS TABLE --
-- -------------- --

CREATE TABLE concerts (
    concert_id  INTEGER(10) PRIMARY KEY,
    concert_title VARCHAR(256),
    location VARCHAR(256),
    date_of_concert DATE
);

-- Linking table artists and concerts to support multiple artists per consert
CREATE TABLE artist_concerts_link (
    artist_id  INTEGER(10),
    concert_id  INTEGER(10),
    PRIMARY KEY (artist_id, concert_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (concert_id) REFERENCES concerts(concert_id)
);

-- Linking table concerts and songs to support multiple songs per concert
CREATE TABLE concerts_songs_link (
    concert_id  INTEGER(10),
    song_id  INTEGER(10),
    order_performance TINYINT(4),
    PRIMARY KEY (concert_id, song_id),
    FOREIGN KEY (concert_id) REFERENCES concerts(concert_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    -- Adding a constraint to prevent two songs of a same concert to have the same order number
    CONSTRAINT unique_order_performance UNIQUE (concert_id, order_performance)
);


-- --------- --
-- FAN TABLE --
-- --------- --

CREATE TABLE fans (
    fan_id  INTEGER(10) PRIMARY KEY,
    fan_name VARCHAR(128),
    fan_email VARCHAR(128) UNIQUE,
    age TINYINT(3)
);

-- Favorite artists of each fan
CREATE TABLE fan_favorites (
    fan_id  INTEGER(10),
    artist_id  INTEGER(10),
    PRIMARY KEY (fan_id, artist_id),
    FOREIGN KEY (fan_id) REFERENCES fans(fan_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);


-- ------------- --
-- TICKETS TABLE --
-- ------------- --
CREATE TABLE concerts_tickets (
    ticket_id INTEGER(10) PRIMARY KEY,
    concert_id INTEGER(10),
    purchase_date DATE,
    ticket_price DOUBLE,
    FOREIGN KEY (concert_id) REFERENCES concerts(concert_id)
);

-- Linking table fans and tickets to support multiple fans per ticket
CREATE TABLE fan_tickets_link (
    fan_id INT,
    ticket_id INT,
    seat_zone VARCHAR(16),
    seat_number VARCHAR(16),
    PRIMARY KEY (fan_id, ticket_id),
    FOREIGN KEY (fan_id) REFERENCES fans(fan_id),
    FOREIGN KEY (ticket_id) REFERENCES concerts_tickets(ticket_id)
);


-- ---------------------------------------- --
--            NOTIFICATIONS TABLE           --
-- For when an artist is added to a concert --
-- ---------------------------------------- --
CREATE TABLE notifications (
    artist_id INTEGER(10), 
    message VARCHAR(256), 
    notification_date DATE,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);
