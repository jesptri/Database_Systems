CREATE VIEW concerts_summary AS
SELECT c.concert_title, COUNT(csl.song_id) AS total_songs_performed, SUM(s.length) AS total_time, COUNT(DISTINCT(ct.ticket_id)) AS total_places_sold
FROM concerts AS c
JOIN artist_concerts_link AS acl ON c.concert_id = acl.concert_id
JOIN concerts_songs_link AS csl ON c.concert_id = csl.concert_id
JOIN songs AS s ON csl.song_id = s.song_id
JOIN concerts_tickets AS ct on c.concert_id = ct.concert_id
GROUP BY
	c.concert_title
HAVING COUNT(csl.song_id > 3);
