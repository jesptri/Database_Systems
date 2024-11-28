-- 4. Write one BEFORE and one AFTER trigger for the modified schema. 


CREATE TRIGGER delete_link_on_fan_delete
AFTER DELETE ON fans
FOR EACH ROW BEGIN
	IF OLD.fan_id IN (SELECT fan_id FROM fan_tickets_link ) THEN
    	DELETE FROM fan_tickets_link WHERE fan_id = OLD.fan_id;
	END IF;
END;


CREATE TRIGGER favorite_artist_update
AFTER INSERT ON fan_favorites
FOR EACH ROW BEGIN
	UPDATE artists
    SET genre = CONCAT(genre, ' (Fan Favorite)')
    WHERE artist_id = NEW.artist_id AND NOT FIND_IN_SET('(Fan Favorite)', genre);
END;



