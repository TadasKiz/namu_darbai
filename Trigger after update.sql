CREATE TRIGGER movie_count_after_update 
   AFTER UPDATE ON movie
   WHEN old.mov_year <> new.mov_year
BEGIN
   	  	INSERT OR IGNORE INTO 'movie_count_by_year' ('mov_year','mov_count')
        SELECT mov_year, COUNT(*) FROM movie 
        WHERE mov_year=new.mov_year AND NOT EXISTS(SELECT 1 FROM movie_count_by_year WHERE mov_year=new.mov_year);
        UPDATE movie_count_by_year
    	SET mov_count = (SELECT COUNT(*)
                            FROM movie 
                            WHERE movie.mov_year = NEW.mov_year)
        WHERE mov_year=NEW.mov_year;
        UPDATE movie_count_by_year
    	SET mov_count = (SELECT COUNT(*)
                            FROM movie 
                            WHERE movie.mov_year = OLD.mov_year)
        WHERE mov_year=OLD.mov_year;
        DELETE FROM movie_count_by_year WHERE mov_count=0;
END;