select * from customers_table;

select * from products_table;

select * from products_table;

select * from  vine_table; 

select * from vine_table;

-- Fiter New  vine table 
select * 
into filtered_vine_table 
FROM vine_table
WHERE total_votes >20  and 
CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5; 

-- Total number of records
select count(*)
FROM  filtered_vine_table;  -- 59221


--  5 star Review ratings with Vine
select count(*) 
from filtered_vine_table 
where vine = 'Y' and 
star_rating =5;      -- 410

--  5 star Review ratings without Vine
select count(*) 
from filtered_vine_table 
where vine = 'N' and 
star_rating = 5;    --28043

select count(*) 
into paid_count
from filtered_vine_table 
where vine = 'Y' and 
star_rating = 5; 


select count(*) 
into not_paid_count
from filtered_vine_table 
where vine = 'N' and 
star_rating = 5; 

-- paid reviews   percentage 
SELECT 100* 
		cast ((select count(*) 
				From filtered_vine_table vy 
				where vy.vine = 'Y' and 
				vy.star_rating = 5) AS FLOAT) /cast (count(*) as float) 
FROM filtered_vine_table fvt
WHERE fvt.star_rating =5;    ---1.4409728323902575

-- not paid reviews 
SELECT 100 * 
			cast ((select count(*) 
				From filtered_vine_table vny 
				where vny.vine = 'N' and 
				vny.star_rating = 5) AS FLOAT) /cast (count(*) as float)				
FROM filtered_vine_table fvt
WHERE fvt.star_rating =5;    --98.55902716760974

--  Analysis of data with paid and unpaid five star ratings
select count(*) from vine_table;   -- 4864249
-- all five star rating from vine_table
select count(*) from vine_table where star_rating =5;   --3076917 
-- Total number of paid five start reviews
select count(*)from vine_table  where  star_rating = 5  and vine ='Y';   --17071
--percentage of paid reviews 
17071 /3076917 =  17071 is what % of 3076917 = 0.55%
-- Total number of not paid five start reviews
select count(*)from vine_table  where  star_rating = 5  and vine ='N';   --3059846
--percentage of not paid reviews 
3059846/3076917 ==3059846 is what % of 3076917 = 99.45%

-- Analysis of data with paid and unpaid less than five star ratings 
select count(*)from vine_table  where  star_rating < 5;    ---1787326
-- paid reviews 
select count(*)from vine_table  where  star_rating < 5  and vine ='Y';   --24764
-- percentage     24764 is what % of 1787326 = 1.39%
--  not paid reviews 
select count(*)from vine_table  where  star_rating < 5  and vine ='N';    --1762562 
--- percentage   1762562 is what % of 1787326 = 98.61%

-- Analysis of data with paid and unpaid five star ratings  of filtered data
-- Total number of reviews   from filtered table data 
select count(*)from filtered_vine_table;   --  59221 
-- Total number of five star reviews 
select count(*)from filtered_vine_table  where  star_rating = 5;   -- 28453
-- Total number of paid five start reviews
select count(*)from filtered_vine_table  where  star_rating = 5  and vine ='Y';  --410
-- Percentage of total number of paid five star reviews 
--410/28453      410 is what % of 28453 = 1.44%
-- Total number of not pait reviews 
select count(*)from filtered_vine_table  where  star_rating = 5  and vine ='N';  -- 28043
-- Percentage of total number of not paid five star reviews 
--28043 is what % of 28453 = 98.56%

--Data indicates that there are only 1.4% 5 star paid reviews and remaining 98% are unpaid reviews. 
--It proves that trend is consistant whather reviewers are paid or Unpaid.
-- Comparison between five star and less than five star reviews shows consistant trend.
--Therefore it can be concluded that reviews by vines are not bised.  
    