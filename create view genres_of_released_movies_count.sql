CREATE VIEW genres_of_released_movies_count AS
SELECT COUNT(DISTINCT gen_id) AS genres_count
       FROM movie_genres;