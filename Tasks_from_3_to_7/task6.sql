DELIMITER //
CREATE OR REPLACE PROCEDURE AddSongAlmbumLink(IN song_id_in INTEGER(10), IN album_id_in INTEGER(10))
MODIFIES SQL DATA
BEGIN
	
  DECLARE release_date_song DATE;
  DECLARE release_date_album DATE;
  
  START TRANSACTION;
  
  IF NOT (song_id_in IN (SELECT song_id FROM songs_album_link) AND album_id_in IN (SELECT album_id FROM songs_album_link)) THEN
    INSERT INTO songs_album_link
        VALUES (song_id_in, album_id_in);
  END IF;

    

    SELECT release_date INTO release_date_song FROM songs WHERE song_id = song_id_in;

    SELECT release_date INTO release_date_album FROM albums WHERE album_id = album_id_in;

    IF release_date_song > release_date_album THEN
        UPDATE songs
        SET release_date = release_date_album
        WHERE song_id = song_id_in;
    END IF;
    
  END IF;
  
  COMMIT;
  
END;
//