INSERT INTO artists (artist_id, artist_name, genre, debut_year) 
VALUES 
(1, 'Avicii', 'EDM', 2008),
(2, 'Bruce Springsteen', 'Rock', 1973);

INSERT INTO albums (album_id, album_title, release_date)
VALUES 
(1, 'True', '2013-09-13'),
(2, 'Born in the U.S.A.', '1984-06-04');

INSERT INTO songs (song_id, song_title, length, release_date)
VALUES 
(1, 'Wake Me Up', 4.09, '2013-06-17'),
(3, 'Hey Brother', 4.14, '2013-09-13'),
(4, 'Addicted to You', 2.31, '2013-09-13'),
(5, 'Dear Boy', 3.47, '2013-09-13'),
(6, 'Liar Liar', 3.17, '2013-09-13'),
(7, 'Shame on Me', 4.11, '2013-09-13'),
(8, 'Lay Me Down', 4.22, '2013-09-13'),
(9, 'Dancing in My Head', 3.59, '2013-09-13'),
(11, 'Born in the U.S.A.', 4.42, '1984-05-04'),
(12, 'Darlington County', 4.50, '1984-06-04'),
(13, 'Working on the Highway', 3.12, '1984-06-04'),
(14, 'I\'m on Fire', 2.38, '1984-06-04'),
(15, 'No Surrender', 4.03, '1984-06-04'),
(16, 'Bobby Jean', 4.30, '1984-06-04'),
(17, 'I\'m Goin\' Down', 3.30, '1984-06-04'),
(18, 'Glory Days', 4.17, '1984-06-04'),
(19, 'Dancing in the Dark', 4.02, '1984-06-04'),
(20, 'My Hometown', 4.33, '1984-06-04');

INSERT INTO artist_albums_link (artist_id, album_id) 
VALUES 
(1, 1),
(2, 2);

INSERT INTO artists_songs_link (artist_id, song_id) 
VALUES 
(1, 1), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9),
(2, 11), (2, 12), (2, 13), (2, 14), (2, 15), (2, 16), (2, 17), (2, 18),
(2, 19), (2, 20);

INSERT INTO concerts (concert_id, concert_title, location, date_of_concert)
VALUES 
(1, 'Avicii World Tour', 'Miami, USA', '2014-07-10'),
(2, 'Bruce Springsteen Concert', 'New York, USA', '1985-09-20');

INSERT INTO artist_concerts_link (artist_id, concert_id) 
VALUES
(1, 1),
(2, 2);

INSERT INTO concerts_songs_link (concert_id, song_id, order_performance)
VALUES 
(1, 1, 1), (1, 3, 2), (1, 4, 3), (1, 5, 4), (1, 6, 5),
(2, 11, 1), (2, 12, 2), (2, 13, 3), (2, 14, 4), (2, 15, 5);

INSERT INTO fans (fan_id, fan_name, fan_email, age)
VALUES 
(1, 'Sean Murphy', 'sean.murphy@example.ie', 18),
(2, 'Aoife O\'Brien', 'aoife.obrien@example.ie', 18),
(3, 'Patrick Doyle', 'patrick.doyle@example.ie', 18),
(4, 'Roisin Kelly', 'roisin.kelly@example.ie', 18);

INSERT INTO fan_favorites (fan_id, artist_id)
VALUES 
(1, 1),
(2, 2),
(3, 1),
(4, 2);

INSERT INTO concerts_tickets (ticket_id, concert_id, purchase_date, ticket_price, seat_zone, seat_number)
VALUES 
(1, 1, '2014-06-15', 75.50, 'Section1', 'A12'),
(2, 2, '1985-09-01', 80.00, 'Section3', 'C10');

INSERT INTO fan_tickets_link (fan_id, ticket_id)
VALUES 
(1, 1),
(2, 2);
