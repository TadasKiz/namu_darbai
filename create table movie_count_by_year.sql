CREATE TABLE 'movie_count_by_year' ('mov_year' INTEGER NOT NULL,
                      			  'mov_count' INTEGER NOT NULL,
                             	  UNIQUE(mov_year, mov_count));