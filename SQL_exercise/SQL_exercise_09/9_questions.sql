-- 9.1 give the total number of recordings in this table
select count(*) from cran_logs;
-- 9.2 the number of packages listed in this table?
SELECT count(DISTINCT package) FROM cran_logs;
-- 9.3 How many times the package "Rcpp" was downloaded?
SELECT count(package) FROM cran_logs WHERE package='Rcpp';
-- 9.4 How many recordings are from China ("CN")?
SELECT count(country) FROM cran_logs WHERE country='CN';
-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
SELECT package,count(package) FROM cran_logs GROUP BY package ORDER BY time DESC;

-- 9.6 Give the package ranking (based on how many times it was downloaded)
-- during 9AM to 11AM
SELECT cran.package,count(cran.package) from (SELECT * FROM cran_logs WHERE substr(time,1,5)<'11:00' and substr(time,1,5)>'09:00') cran GROUP by cran.package order by count(cran.package) desc;

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
SELECT count(*) FROM cran_logs where country in ('CN','JP','SG');
-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
SELECT country,count(package) from cran_logs GROUP by country HAVING count(package) > (SELECT count(*) from cran_logs WHERE country='CN');
-- 9.9 Print the average length of the package name of all the UNIQUE packages
SELECT avg(length(DISTINCT package)) FROM cran_logs;
-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
SELECT package,count(package) from cran_logs GROUP by package ORDER by count(package) DESC LIMIT 1 OFFSET 1;
-- 9.11 Print the name of the package whose download count is bigger than,count(package) from cran_logs GROUP by package having count(package)>1000;
-- 9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
SELECT substr(r_os,1,6) ros,count(substr(r_os,1,6)) count,(count(substr(r_os,1,6))/(SELECT count(*) from cran_logs))*100 prop FROM cran_logs GROUP by ros;
