-- 3. Create a view for the modified schema. The view must use a join and both GROUP BY and HAVING clauses. Aim at demonstrating advanced SQL skills.

CREATE VIEW concerts_over_one_thousand_places_summary AS
SELECT c.concert_title, COUNT(csl.song_id) AS total_songs_performed, SUM(s.length) AS total_time, COUNT(DISTINCT ct.ticket_id) AS total_places_sold
FROM concerts AS c
JOIN artist_concerts_link AS acl ON c.concert_id = acl.concert_id
JOIN concerts_songs_link AS csl ON c.concert_id = csl.concert_id
JOIN songs AS s ON csl.song_id = s.song_id
JOIN concerts_tickets AS ct on c.concert_id = ct.concert_id
GROUP BY c.concert_title
HAVING COUNT(total_places_sold > 1000)
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

CREATE TRIGGER notify_artiste_on_new_concert
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
    
    SELECT COUNT(ticket_id) INTO seats
    FROM concerts_tickets
    WHERE concert_id = id;
    
    RETURN seats;
END//

DELIMITER ;

-- Example Use case
SELECT total_nr_of_occupied_seats() AS total_occupied_seats;


-- 6.  Write a stored procedure that checks whether a given song_id is associated with a given album_id. 
--      If not, insert this association into the database. 
--      Additionally, adjust the song’s release date if it is later than the album’s.