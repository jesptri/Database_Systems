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
(1, 'Wake Me Up', 272, '2013-06-17'),
(3, 'Hey Brother', 254, '2013-09-13'),
(4, 'Addicted to You', 151, '2013-09-13'),
(5, 'Dear Boy', 257, '2013-09-13'),
(6, 'Liar Liar', 208, '2013-09-13'),
(7, 'Shame on Me', 253, '2013-09-13'),
(8, 'Lay Me Down', 262, '2013-09-13'),
(9, 'Dancing in My Head', 239, '2013-09-13'),
(11, 'Born in the U.S.A.', 282, '1984-05-04'),
(12, 'Darlington County', 290, '1984-06-04'),
(13, 'Working on the Highway', 192, '1984-06-04'),
(14, 'I\'m on Fire', 158, '1984-06-04'),
(15, 'No Surrender', 243, '1984-06-04'),
(16, 'Bobby Jean', 270, '1984-06-04'),
(17, 'I\'m Goin\' Down', 210, '1984-06-04'),
(18, 'Glory Days', 257, '1984-06-04'),
(19, 'Dancing in the Dark', 242, '1984-06-04'),
(20, 'My Hometown', 273, '1984-06-04');

INSERT INTO artist_albums_link (artist_id, album_id) 
VALUES 
(1, 1),
(2, 2);

INSERT INTO artists_songs_link (artist_id, song_id) 
VALUES 
(1, 1), 
(1, 3), 
(1, 4), 
(1, 5), 
(1, 6), 
(1, 7), 
(1, 8), 
(1, 9),
(2, 11), 
(2, 12), 
(2, 13), 
(2, 14), 
(2, 15), 
(2, 16), 
(2, 17), 
(2, 18),
(2, 19), 
(2, 20);

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
(1, 1, 1), 
(1, 3, 2), 
(1, 4, 3), 
(1, 5, 4), 
(1, 6, 5),
(2, 11, 1), 
(2, 12, 2), 
(2, 13, 3), 
(2, 14, 4), 
(2, 15, 5);

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

INSERT INTO fans (fan_id, fan_name, fan_email, age)
VALUES 
(5, 'John Doe', 'john.doe@example.com', 25),
(6, 'Jane Smith', 'jane.smith@example.com', 22),
(7, 'Emily Clark', 'emily.clark@example.com', 30),
(8, 'James Johnson', 'james.johnson@example.com', 28),
(9, 'Alice Brown', 'alice.brown@example.com', 26),
(10, 'David Wilson', 'david.wilson@example.com', 24),
(11, 'Chris Lee', 'chris.lee@example.com', 21),
(12, 'Michael Green', 'michael.green@example.com', 33),
(13, 'Sarah Adams', 'sarah.adams@example.com', 27),
(14, 'Tom Harris', 'tom.harris@example.com', 35),
(15, 'Kate Miller', 'kate.miller@example.com', 23),
(16, 'Laura Lewis', 'laura.lewis@example.com', 29),
(17, 'Mark Walker', 'mark.walker@example.com', 32),
(18, 'Paul Young', 'paul.young@example.com', 20),
(19, 'Sophie King', 'sophie.king@example.com', 31);

INSERT INTO fan_favorites (fan_id, artist_id)
VALUES 
(5, 1), 
(6, 2), 
(7, 1), 
(8, 2), 
(9, 1), 
(10, 2),
(11, 1), 
(12, 2), 
(13, 1), 
(14, 2), 
(15, 1), 
(16, 2), 
(17, 1), 
(18, 2), 
(19, 1);

INSERT INTO concerts_tickets (ticket_id, concert_id, purchase_date, ticket_price, seat_zone, seat_number)
VALUES 
(3, 1, '2014-06-20', 75.50, 'Section1', 'A13'),
(4, 1, '2014-06-25', 75.50, 'Section1', 'A14'),
(5, 1, '2014-07-01', 75.50, 'Section2', 'B10'),
(6, 2, '1985-09-05', 80.00, 'Section2', 'B12'),
(7, 2, '1985-09-10', 80.00, 'Section3', 'C11'),
(8, 2, '1985-09-15', 80.00, 'Section1', 'A11'),
(9, 1, '2014-07-05', 75.50, 'Section2', 'B13'),
(10, 1, '2014-07-08', 75.50, 'Section3', 'C12'),
(11, 2, '1985-09-18', 80.00, 'Section3', 'C13'),
(12, 2, '1985-09-20', 80.00, 'Section2', 'B14');

INSERT INTO fan_tickets_link (fan_id, ticket_id)
VALUES 
(5, 3), 
(6, 3),
(7, 4), 
(8, 4),
(9, 5),
(10, 6),
(11, 7), 
(12, 7),
(13, 8),
(14, 9),
(15, 10), 
(16, 10),
(17, 11), 
(18, 11),
(19, 12);
