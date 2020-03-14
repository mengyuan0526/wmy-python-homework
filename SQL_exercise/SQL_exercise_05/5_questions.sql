-- Pieces_and_providers
-- 5.1 Select the name of all the pieces. 
SELECT name FROM pieces;
-- 5.2  Select all the providers' data. 
SELECT * FROM providers;
-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
SELECT piece,round(avg(price),2) as avg_pri from provides GROUP by piece;
-- 5.4  Obtain the names of all providers who supply piece 1.
SELECT name from providers a INNER JOIN provides b on a.code=b.provider WHERE b.piece=1;
-- 5.5 Select the name of pieces provided by provider with code "HAL".
SELECT name from pieces a INNER join provides b on a.code=b.piece WHERE b.provider='HAL';
-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).???
-- ---------------------------------------------
SELECT c.name,a.name,b.price  
from providers a 
inner join provides b 
on a.code=b.provider 
INNER JOIN pieces c 
on b.piece=c.code 
WHERE b.price 
in (SELECT max(price) 
from provides 
GROUP by piece);--- 不太对

-- 5.7 Add an entry to the database to indicate that "Skellington Supplies"
-- (code "TNBC") will provide sprockets (code "1") for 7 cents each.
INSERT into provides(piece,provider,price) VALUES(1,'TNBC',7);

-- 5.8 Increase all prices by one cent.
UPDATE provides set price=price+1;
-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
UPDATE provides set piece=1 WHERE piece in (SELECT piece FROM provides WHERE provider='RBT'and piece=4);
-- 检验
SELECT *  
from providers a 
inner join provides b 
on a.code=b.provider 
INNER JOIN pieces c 
on b.piece=c.code ;
-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
DELETE FROM provides WHERE provider='RBT';