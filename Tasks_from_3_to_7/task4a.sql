CREATE TRIGGER delete_link_on_fan_delete
BEFORE DELETE ON fans
FOR EACH ROW BEGIN
    SET foreign_key_checks = 0;
	IF OLD.fan_id IN (SELECT fan_id FROM fan_tickets_link ) THEN
    	DELETE FROM fan_tickets_link WHERE fan_id = OLD.fan_id;
	END IF;
    SET foreign_key_checks = 1;
END;