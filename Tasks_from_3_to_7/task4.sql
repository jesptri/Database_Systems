-- 4. Write one BEFORE and one AFTER trigger for the modified schema. 


CREATE TRIGGER fan_age_check
BEFORE INSERT ON fans
FOR EACH ROW BEGIN
	IF NEW.age < 0 THEN
    	SIGNAL SQLSTATE '45000' # unhandled user-defined exception
        SET MESSAGE_TEXT = 'Fans must be at least 18 years old';
	END IF;
END;


CREATE TRIGGER favorite_artist_update
AFTER INSERT ON fan_favorites
FOR EACH ROW BEGIN
	UPDATE artists
    SET genre = CONCAT(genre, ' (Fan Favorite)')
    WHERE artist_id = NEW.artist_id AND NOT FIND_IN_SET('(Fan Favorite)', genre);
END;



