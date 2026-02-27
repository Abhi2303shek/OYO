create database oyo_sales;
use oyo_sales;

select * from oyo limit 10;

-- / -- 🏨 Pricing & Revenue Insights -- /
## 1. What is the average, minimum, and maximum price of hotels overall?
select avg(price), min(price), max(price) from oyo;

## 2. What is the average price of hotels in each location?
select location, avg(price) as avg_price from oyo group by location;

## 3. Which top 5 locations have the highest average hotel prices?
select location, avg(price) as avg_price from oyo group by location order by avg_price desc limit 5;

## 4. Which top 5 locations have the lowest average hotel prices?
select location, avg(price) as avg_price from oyo group by location order by avg_price asc limit 5;

## 5. What is the distribution of hotels across different price ranges (budget, mid-range, premium)?
select case when price>4000 then 'Premium' when price>2000 then 'Mid' else 'Budget' end as price_range, count(*) as total from oyo group by price_range;

## 6. What is the average discount percentage offered across all hotels?
select avg(discount) from oyo;

## 7. Which locations offer the highest average discount?
select location, avg(discount) as avg_discount from oyo group by location;

## 8. Which hotels provide the highest absolute discount amount (price − final_price)?
select hotel, (price - (discount/100)*price) as absolute from oyo order by absolute desc limit 1;

## 9. What is the average final price after discount by location?
select location, round(avg(price - (discount/100)*price),2) as absolute from oyo group by location;

## 10. Do higher-priced hotels offer higher discount percentages?
select hotel, price, discount from oyo where price > (select avg(price) from oyo) and discount > (select avg(discount) from oyo);



-- /-- 👥 Popularity & Demand Insights (Using ratings as count)  --/

## 11. Which hotels have the highest number of ratings (most popular)?
select hotel, rating from oyo order by rating desc limit 1;

## 12. Which locations have the highest total ratings?
select location, sum(rating) as nett from oyo group by location order by nett desc limit 1;

## 13. What is the average ratings count per hotel by location?
select location, avg(rating) as nett from oyo group by location order by nett desc limit 1;

## 14. Do lower-priced hotels receive more ratings?
select round(avg(rating),2) as avg_rated from oyo where price<2000;

## 15. Do higher discounts result in higher ratings count?
select hotel, discount, rating from oyo where discount > (select avg(discount) from oyo) and rating > (select avg(rating) from oyo);

## 16. What percentage of hotels have ratings above the dataset average?
select round((sum(case when rating > (select avg(rating) from oyo) then '1' else '0 ' end) / count(*) *100),2) as percent from oyo;

## 17. Which hotels are “hidden demand winners” (low price + high ratings)?
select hotel, price, rating from oyo where price < (select avg(price) from oyo) and rating > (select avg(rating) from oyo);

## 18. Which hotels are overpriced but still popular?
select hotel, price, rating from oyo where price > 3000 and rating > (select avg(rating) from oyo);

## 19. Is there a relationship between price and popularity?
select price, rating from oyo order by price;

## 20. Which locations have the most consistently popular hotels?
select location, round(avg(rating),2) as avg_rated, count(*) as hotel_count from oyo group by location having hotel_count>2 order by avg_rated desc;



-- / -- 📊 Competition & Market Structure  --/
## 21. Which location has the highest number of hotels (highest competition)?
select location, count(*) as hotel_count from oyo group by location order by hotel_count desc;

## 22. Which location generates the highest total potential revenue (avg price × hotel count)?
select location, round(avg(price),2) as avg_price, round(count(*) * avg(price),2) as revenue_potential from oyo group by location order by revenue_potential desc limit 1;

## 23. Do locations with more hotels have lower average prices?
select location, round(avg(price),2) as avg_price, count(*) as hotel_count from oyo group by location order by hotel_count desc;

## 24. Which locations have the highest pricing spread (max − min price)?
select location, round(avg(price),2) as avg_price, max(price), min(price), (max(price) - min(price)) as pricing_spread from oyo group by location order by pricing_spread desc limit 1;

## 25. Which hotels have very low ratings count (low visibility risk)?
select hotel, rating from oyo where rating < 500;

## 26. Which location has the highest average ratings per hotel?
select location, avg(rating) as nett from oyo group by location order by nett desc limit 1;

## 27. Which price segment attracts the highest total ratings?
select case when price > 6000 then 'Premium' when price > 3000 then 'Mid' else 'Budget' end as price_segment, avg(rating) as nett from oyo group by price_segment order by nett desc;

## 28. What percentage of hotels fall into each popularity band (Low, Medium, High)?
select case when rating > 4000 then 'High' when rating > 2000 then 'Medium' else 'Low' end as rating_segment, count(*) as hotel_count from oyo group by rating_segment;

## 29. Which hotels combine high discount + high popularity?
select hotel, discount, rating from oyo where discount >=50 and rating > (select avg(rating) from oyo) order by rating;

## 30. Which locations offer the best value in terms of low price but high ratings count?
select location, avg(price) as avg_price, avg(rating) as avg_rated from oyo group by location order by avg_price asc, avg_rated desc;




-- /--  🧠 Advanced Business-Level Insights (Recruiter Impressers)   --/
## 31. Can hotels be segmented into Budget, Mid-range, and Premium categories based on price?
select case when price > 4000 then 'Premium' when price > 2000 then 'Mid' else 'Budget' end as price_tier, count(*) from oyo group by price_tier;

## 32. Which segment attracts the highest average ratings count?
select case when price > 4000 then 'Premium' when price > 2000 then 'Mid' else 'Budget' end as price_tier, round(avg(rating),2) as avg_rate from oyo group by price_tier order by avg_rate desc limit 1;

## 33. Which segment offers the highest average discount?
select case when price > 4000 then 'Premium' when price > 2000 then 'Mid' else 'Budget' end as price_tier, round(avg(discount),2) as avg_off from oyo group by price_tier order by avg_off desc limit 1;

## 34. Are premium hotels less dependent on discounts for popularity?
select avg(discount), round(avg(rating),2) as avg_rating from oyo where price>4000;

## 35. Which 10 hotels have the highest “popularity efficiency” (ratings ÷ price)?
select hotel, round(rating/price,2) as popularity_eff from oyo order by popularity_eff desc limit 10;

## 36. Which locations are overpriced relative to their popularity?
select location, price, rating from oyo where price > 4500 and rating < (select avg(rating) from oyo) order by rating desc;

## 37. Which locations show strong demand despite low discounts?
select location, discount, rating from oyo where discount < 50 and rating > (select avg(rating) from oyo) order by rating desc;

## 38. Is there evidence of psychological pricing (price clustering patterns)?
select price, count(*) as freq from oyo group by price order by freq desc;

## 39. Do heavily discounted hotels actually gain popularity advantage?
select avg(rating), discount as avg_rated from oyo group by discount order by discount desc;

## 40. Which location appears most competitive based on price variation and popularity concentration?
select location, count(*) as hotel_count, max(price) - min(price) as price_spread, sum(rating) as nett from oyo group by location order by hotel_count desc;

