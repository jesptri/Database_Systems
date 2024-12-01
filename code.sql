-- 3. Create a view for the modified schema. The view must use a join and both GROUP BY and HAVING clauses. Aim at demonstrating advanced SQL skills.

CREATE VIEW concerts_over_one_places_summary AS
SELECT c.concert_title, COUNT(csl.song_id) AS total_songs_performed, SUM(s.length) AS total_time, COUNT(DISTINCT ct.ticket_id) AS total_places_sold
FROM concerts AS c
JOIN artist_concerts_link AS acl ON c.concert_id = acl.concert_id
JOIN concerts_songs_link AS csl ON c.concert_id = csl.concert_id
JOIN songs AS s ON csl.song_id = s.song_id
JOIN concerts_tickets AS ct on c.concert_id = ct.concert_id
GROUP BY c.concert_title
HAVING COUNT(DISTINCT ct.ticket_id) > 1
ORDER BY total_places_sold;


-- 4. Write one BEFORE and one AFTER trigger for the modified schema. 

DELIMITER //

CREATE TRIGGER fan_deletion
BEFORE DELETE ON fans
FOR EACH ROW 
BEGIN
    DELETE FROM fan_tickets_link 
    WHERE fan_id = OLD.fan_id;
    DELETE FROM fan_favorites 
    WHERE fan_id = OLD.fan_id;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER notify_artist_on_new_concert
AFTER INSERT ON artist_concerts_link
FOR EACH ROW
BEGIN
    DECLARE concert_date DATE;

    SELECT date_of_concert
    INTO concert_date
    FROM concerts
    WHERE concert_id = NEW.concert_id;

    INSERT INTO notifications (artist_id, message, notification_date)
    VALUES (NEW.artist_id, CONCAT('New concert scheduled on ', concert_date), NOW());
END//

DELIMITER ;


-- 5. Write a stored function that returns the total number of occupied seats for a given concert_id.
DELIMITER //

CREATE OR REPLACE FUNCTION total_nr_of_occupied_seats(id INT)
RETURNS INT
BEGIN
    DECLARE seats INT;
    
    SELECT COUNT(fan_id) INTO seats
    FROM (
        SELECT fan_id 
        FROM concerts_tickets NATURAL JOIN fan_tickets_link
        WHERE concert_id = id
    ) AS F;
    
    RETURN seats;
END//

DELIMITER ;

-- Example Use case
SELECT total_nr_of_occupied_seats(9) AS total_occupied_seats;


-- 6.  Write a stored procedure that checks whether a given song_id is associated with a given album_id. 
--      If not, insert this association into the database. 
--      Additionally, adjust the song’s release date if it is later than the album’s.

DELIMITER //
CREATE OR REPLACE PROCEDURE add_song_album_link(IN song_id_in INTEGER(10), IN album_id_in INTEGER(10))
MODIFIES SQL DATA
BEGIN
	
    DECLARE release_date_song DATE;
    DECLARE release_date_album DATE;
    DECLARE artist_id_in INTEGER(10);

    START TRANSACTION;

    SELECT artist_id INTO artist_id_in FROM artist_album_song_link WHERE song_id = song_id_in LIMIT 1;

    IF NOT EXISTS (SELECT 1 FROM artist_album_song_link WHERE artist_id = artist_id_in AND album_id = album_id_in AND song_id = song_id_in) THEN
        INSERT INTO artist_album_song_link (artist_id, album_id, song_id) 
        VALUES (artist_id_in, album_id_in, song_id_in);
    END IF;

    SELECT release_date INTO release_date_song FROM songs WHERE song_id = song_id_in;
    SELECT release_date INTO release_date_album FROM albums WHERE album_id = album_id_in;

    IF release_date_song > release_date_album THEN
        UPDATE songs
        SET release_date = release_date_album
        WHERE song_id = song_id_in;
    END IF;

    COMMIT;
  
END;
//

-- Example Use case
CALL add_song_album_link(11,2);