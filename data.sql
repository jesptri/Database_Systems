INSERT INTO artists (artist_id, artist_name, genre, debut_year) VALUES
(1, 'The Beatles', 'Rock', 1960),
(2, 'Adele', 'Pop', 2008),
(3, 'Billie Eilish', 'Pop', 2015),
(4, 'Ed Sheeran', 'Pop', 2011),
(5, 'Nirvana', 'Grunge', 1987),
(6, 'Drake', 'Hip Hop', 2006),
(7, 'Taylor Swift', 'Country', 2006),
(8, 'Kendrick Lamar', 'Hip Hop', 2010),
(9, 'Elton John', 'Pop', 1962),
(10, 'Beyoncé', 'Pop', 2003);

INSERT INTO albums (album_id, album_title, release_date) VALUES
(1, 'Abbey Road', '1969-09-26'),
(2, '21', '2011-01-24'),
(3, 'When We All Fall Asleep, Where Do We Go?', '2019-03-29'),
(4, 'Divide', '2017-03-03'),
(5, 'Nevermind', '1991-09-24'),
(6, 'Scorpion', '2018-06-29'),
(7, 'Fearless', '2008-11-11'),
(8, 'DAMN.', '2017-04-14'),
(9, 'Goodbye Yellow Brick Road', '1973-10-05'),
(10, 'Lemonade', '2016-04-23');

INSERT INTO songs (song_id, song_title, length, release_date) VALUES
(1, 'Come Together', 4.20, '1969-09-26'),
(2, 'Rolling in the Deep', 3.48, '2011-01-24'),
(3, 'Bad Guy', 3.14, '2019-03-29'),
(4, 'Shape of You', 3.53, '2017-03-03'),
(5, 'Smells Like Teen Spirit', 5.01, '1991-09-24'),
(6, 'God’s Plan', 3.18, '2018-06-29'),
(7, 'Love Story', 3.55, '2008-11-11'),
(8, 'HUMBLE.', 2.57, '2017-04-14'),
(9, 'Rocket Man', 4.41, '1973-10-05'),
(10, 'Sorry', 3.50, '2016-04-23'),
(11, 'Imagine', 3.15, '1971-10-11');  -- Song that belongs to 2 albums and created by 2 artists

INSERT INTO artist_album_song_link (artist_id, album_id, song_id) VALUES
(1, 1, 1),  -- The Beatles - Abbey Road - Come Together
(1, 1, 11), -- The Beatles - Abbey Road - Imagine
(2, 2, 2),  -- Adele - 21 - Rolling in the Deep
(3, 3, 3),  -- Billie Eilish - When We All Fall Asleep - Bad Guy
(4, 4, 4),  -- Ed Sheeran - Divide - Shape of You
(5, 5, 5),  -- Nirvana - Nevermind - Smells Like Teen Spirit
(6, 6, 6),  -- Drake - Scorpion - God’s Plan
(7, 7, 7),  -- Taylor Swift - Fearless - Love Story
(8, 8, 8),  -- Kendrick Lamar - DAMN. - HUMBLE.
(9, 9, 9),  -- Elton John - Goodbye Yellow Brick Road - Rocket Man
(10, 10, 10), -- Beyoncé - Lemonade - Sorry
(1, 5, 11),  -- The Beatles - Nevermind - Imagine
(6, 6, 11);  -- Drake - Scorpion - Imagine

INSERT INTO concerts (concert_id, concert_title, location, date_of_concert) VALUES
(1, 'The Beatles Live', 'London', '1969-08-08'),
(2, 'Adele World Tour', 'New York', '2011-06-20'),
(3, 'Billie Eilish: Happier Than Ever', 'Los Angeles', '2022-04-23'),
(4, 'Ed Sheeran Concert', 'Manchester', '2018-05-24'),
(5, 'Nirvana Reunion', 'Seattle', '2023-01-14'),
(6, 'Drake Summer Jam', 'Miami', '2019-08-02'),
(7, 'Taylor Swift 1989 Tour', 'Chicago', '2015-07-12'),
(8, 'Kendrick Lamar Tour', 'Boston', '2018-10-06'),
(9, 'Elton John Farewell Tour', 'Paris', '2021-11-02'),
(10, 'Beyoncé On The Run II', 'Los Angeles', '2018-09-13'),
(11, 'Empty Concert', 'Nowhere', '2024-01-01');

INSERT INTO artist_concerts_link (artist_id, concert_id) VALUES
(1, 1),  -- The Beatles - The Beatles Live
(2, 2),  -- Adele - Adele World Tour
(3, 3),  -- Billie Eilish - Billie Eilish: Happier Than Ever
(4, 4),  -- Ed Sheeran - Ed Sheeran Concert
(5, 5),  -- Nirvana - Nirvana Reunion
(6, 6),  -- Drake - Drake Summer Jam
(7, 7),  -- Taylor Swift - Taylor Swift 1989 Tour
(8, 8),  -- Kendrick Lamar - Kendrick Lamar Tour
(9, 9),  -- Elton John - Elton John Farewell Tour
(10, 10),  -- Beyoncé - Beyoncé On The Run II
(1, 5),  -- The Beatles - Nirvana Reunion (exemple concert avec deux artistes)
(10, 5);  -- Beyoncé - Nirvana Reunion

INSERT INTO concerts_songs_link (concert_id, song_id, order_performance) VALUES
(1, 1, 1),  -- Concert The Beatles Live - Come Together
(1, 11, 2), -- Concert The Beatles Live - Imagine
(2, 2, 1),  -- Concert Adele World Tour - Rolling in the Deep
(3, 3, 1),  -- Concert Billie Eilish - Bad Guy
(4, 4, 1),  -- Concert Ed Sheeran - Shape of You
(5, 5, 1),  -- Concert Nirvana Reunion - Smells Like Teen Spirit
(6, 6, 1),  -- Concert Drake Summer Jam - God’s Plan
(7, 7, 1),  -- Concert Taylor Swift 1989 - Love Story
(8, 8, 1),  -- Concert Kendrick Lamar - HUMBLE.
(9, 9, 1),  -- Concert Elton John Farewell - Rocket Man
(10, 10, 1), -- Concert Beyoncé On The Run II - Sorry

INSERT INTO fans (fan_id, fan_name, fan_email, age) VALUES
(1, 'John Doe', 'johndoe@example.com', 25),
(2, 'Jane Smith', 'janesmith@example.com', 30),
(3, 'Alice Johnson', 'alicej@example.com', 22),
(4, 'Bob Lee', 'boblee@example.com', 28),
(5, 'Charlie Brown', 'charlieb@example.com', 35),
(6, 'Emily White', 'emilyw@example.com', 24),
(7, 'David Clark', 'davidc@example.com', 27),
(8, 'Grace Adams', 'gracea@example.com', 21),
(9, 'Hannah Wilson', 'hannahw@example.com', 26),
(10, 'Ivy Scott', 'ivysc@example.com', 23);

INSERT INTO fan_favorites (fan_id, artist_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO concerts_tickets (ticket_id, concert_id, purchase_date, ticket_price) VALUES
(1, 1, '1969-08-01', 50.00),
(2, 2, '2011-06-15', 75.00),
(3, 3, '2022-04-20', 100.00),
(4, 4, '2018-05-15', 65.00),
(5, 5, '2023-01-10', 80.00),
(6, 6, '2019-07-28', 90.00),
(7, 7, '2015-07-10', 60.00),
(8, 8, '2018-10-01', 85.00),
(9, 9, '2021-10-29', 120.00),
(10, 9, '2018-09-10', 110.00);

INSERT INTO fan_tickets_link (fan_id, ticket_id, seat_zone, seat_number) VALUES
(1, 1, 'VIP', 'A1'),
(2, 2, 'General', 'B2'),
(3, 3, 'VIP', 'C3'),
(4, 4, 'General', 'D4'),
(5, 5, 'VIP', 'E5'),
(6, 6, 'General', 'F6'),
(7, 7, 'VIP', 'G7'),
(8, 8, 'General', 'H8'),
(9, 9, 'VIP', 'I9'),
(10, 9, 'General', 'J10'),
(10, 10, 'General', 'K11');