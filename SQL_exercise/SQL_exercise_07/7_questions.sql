-- Planet_Express 
-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
SELECT * FROM package;
SELECT * FROM client;
SELECT * FROM shipment;
SELECT * FROM employee;
SELECT * FROM planet;
SELECT * FROM has_clearance;
SELECT name from client where accountnumber=(SELECT recipient from package where weight=1.5)

-- 7.2 What is the total weight of all the packages that he sent?
SELECT sum(weight) FROM package WHERE sender=(SELECT accountnumber FROM client WHERE name='Al Gores Head');
