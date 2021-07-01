CREATE VIEW actors_count_in_movie AS
SELECT mov.mov_id,
       COUNT(*) AS actors_count
       FROM movie mov
       INNER JOIN (SELECT DISTINCT mov_id, act_id FROM movie_cast) mc
       ON mov.mov_id = mc.mov_id
       GROUP BY 1;