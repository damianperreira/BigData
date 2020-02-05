--challenge M16

--Splits the reviews between vine (paid) and non-vine (unpaid)
--Number of reviews
SELECT v.vine, 
count(v.review_id) as review_counts
FROM vine_table v
group by v.vine order by 2 desc;

--Number of 5-star reviews (vine vs not vine)
SELECT v.star_rating,v.vine,
count(v.review_id) as review_counts
FROM vine_table v
group by v.star_rating, v.vine;

--average star rating
SELECT v.vine,
avg(v.star_rating::int)/1 as avg_rating
FROM vine_table v
group by v.vine;

--number of helpful votes (vine vs non-vine)
SELECT v.vine,
sum(v.helpful_votes::int) help_ful_votes
FROM vine_table v
group by v.vine
;


--explore vine split by product
SELECT distinct r.product_parent,
p.product_title,
v.vine, 
count(v.review_id) as review_counts
FROM vine_table v
join review_id_table r on  v.review_id = r.review_id
join products p on p.product_id = r.product_id
group by r.product_parent,p.product_title,v.vine order by 4 desc;