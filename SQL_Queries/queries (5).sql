/*Assignment 2
Preksha Raj Shimoga Basavaraja
7446436992
*/

--Q1:
select strftime('%Y',dob) as dobyear, count(*)
from users
group by(dobyear)
having dobyear >= '1970'; 

--Q2:
 select post_time, no_of_ads_created
from ( select strftime('%H', post_date) as post_time, count(*) as no_of_ads_created
         from ads
         group by (post_time))
where no_of_ads_created = (select max(no_of_ads_created)
from ( select strftime('%H', post_date) as post_time, count(*) as no_of_ads_created
from ads
group by (post_time)))

--Q3:
select count(ads.ad_id)
from ads
where ads.category_id=250 and ads.post_date >(select users.last_logout 
from users 
where users.username="lhartj");


 --Q4:
 select cities.name,count(cities.city_id) as no_of_regions
from cities,regions
where regions.city_id=cities.city_id
group by regions.city_id
order by count(*) DESC
limit 1;

--Q5:
select users.name, count(*) as no_of_likes
from ads, likes, users
where ads.ad_id=likes.ad_id and ads.creator=users.username
group by (likes.ad_id)
having no_of_likes=(select max(no_of_likes)
						from(select count(*) as no_of_likes
								from likes
								group by(likes.ad_id)))



--Q6:
select regions.name ,count(*) as no_of_ads
from regions,ads
where regions.region_id=ads.region_id
group by regions.region_id
order by count(*) DESC
limit 1;

--Q7:
 select ads.creator,count(*) as no_of_posts
from ads
where ads.post_date like '2015%'
group by ads.creator
order by count(*) DESC
limit 3;

--Q8:
select  ads.title,ads.price
from ads
where ads.creator='bnguyen50'
group by ads.creator
order by post_date DESC
limit 1;
