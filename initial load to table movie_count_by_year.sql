INSERT INTO 'movie_count_by_year' ('mov_year','mov_count')
SELECT mov_year, COUNT(*) FROM movie GROUP BY 1;