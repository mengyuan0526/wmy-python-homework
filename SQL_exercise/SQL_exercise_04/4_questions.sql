-- Movie_theatres
-- 4.1 Select the title of all movies.
Select title from movies;
-- 4.2 Show all the distinct ratings in the database.
Select distinct rating from movies;
-- 4.3  Show all unrated movies.
Select * from movies where rating is null;
-- 4.4 Select all movie theaters that are not currently showing a movie.
Select name from MovieTheaters where movie is null;
-- 4.5 Select all data from all movie theaters 
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
Select * from MovieTheaters a inner join movies b on a.movie=b.code where a.movie is not null;
-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
Select * from movies a inner join MovieTheaters b on a.code=b.movie where b.movie is not null;
-- 4.7 Show the titles of movies not currently being shown in any theaters.
Select title from movies a inner join MovieTheaters b on a.code=b.movie where b.movie is null;
-- 4.8 Add the unrated movie "One, Two, Three".
insert into movies (code,title,rating) values(9,'One, Two, Three',null)
-- 4.9 Set the rating of all unrated movies to "G".
update movies Set rating='G' where rating is null;
-- 4.10 Remove movie theaters projecting movies rated "NC-17".
DELETE FROM movietheaters WHERE movie= (SELECT code FROM movies WHERE rating='NC-17');