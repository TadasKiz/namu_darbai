CREATE TRIGGER movie_count_after_insert
   AFTER INSERT ON movie
BEGIN
   	  	INSERT OR IGNORE INTO 'movie_count_by_year' ('mov_year','mov_count')
        SELECT mov_year, COUNT(*) FROM movie 
        WHERE mov_year=new.mov_year AND NOT EXISTS(SELECT 1 FROM movie_count_by_year WHERE mov_year=new.mov_year);
        UPDATE movie_count_by_year
    	SET mov_count = (SELECT COUNT(*)
                            FROM movie 
                            WHERE movie.mov_year = NEW.mov_year)
        WHERE mov_year=NEW.mov_year;
END;