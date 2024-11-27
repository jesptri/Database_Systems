-- 3. Create a view for the modified schema. The view must use a join and both GROUP BY and HAVING clauses. Aim at demonstrating advanced SQL skills.

CREATE VIEW concerts_summary AS
SELECT c.concert_title, COUNT(csl.song_id) AS total_songs_performed, SUM(s.length) AS total_time, COUNT(DISTINCT ct.ticket_id) AS total_places_sold
FROM concerts AS c
JOIN artist_concerts_link AS acl ON c.concert_id = acl.concert_id
JOIN concerts_songs_link AS csl ON c.concert_id = csl.concert_id
JOIN songs AS s ON csl.song_id = s.song_id
JOIN concerts_tickets AS ct on c.concert_id = ct.concert_id
GROUP BY
	c.concert_title
HAVING COUNT(csl.song_id > 3);

-- 4. Write one BEFORE and one AFTER trigger for the modified schema. 

DELIMITER //

CREATE TRIGGER fan_age_check
BEFORE INSERT ON fans
FOR EACH ROW BEGIN
	IF NEW.age < 0 THEN
    	SIGNAL SQLSTATE '45000' # unhandled user-defined exception
        SET MESSAGE_TEXT = 'Fans must be at least 18 years old';
	END IF;
END;

//

DELIMITER;


DELIMITER //

CREATE TRIGGER favorite_artist_update
AFTER INSERT ON fan_favorites
FOR EACH ROW BEGIN
	UPDATE artists
    SET genre = CONCAT(genre, ' (Fan Favorite)')
    WHERE artist_id = NEW.artist_id AND NOT FIND_IN_SET('(Fan Favorite)', genre);
END;

//
DELIMITER;

-- 5. Write a stored function that returns the total number of occupied seats for a given concert_id.



-- 6.  Write a stored procedure that checks whether a given song_id is associated with a given album_id. 
--      If not, insert this association into the database. 
--      Additionally, adjust the song’s release date if it is later than the album’s.