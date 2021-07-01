SELECT  rev.rev_name, mov.mov_title FROM rating rat
INNER JOIN movie mov 
ON rat.mov_id = mov.mov_id
INNEr JOIN reviewer rev
ON rat.rev_id = rev.rev_id
WHERE rat.rev_stars > 7 AND rev.rev_name IS NOT NULL;