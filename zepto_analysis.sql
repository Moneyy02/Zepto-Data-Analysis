drop table if exists zepto;

---- CREATING TABLE---
create table zepto(
sku_id serial primary key,
category varchar(120),
name varchar(150) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weightInGms Integer,
outOfStock BOOLEAN,
quantity integer
);

--- data exploration

-- count of rows
select count(*) from zepto;

--sample data
select * from zepto;

--null values
select * from zepto
where name is null
or 
category is null
or 
mrp is null
or
discountPercent is null
or
discountedSellingPrice is null
or
availableQuantity is null
or
weightInGms is null
or 
outOfStock is null
or
quantity is null;

-- different product categories
select distinct category
from zepto
order by category;

-- product in stock vs out of stock
Select outOfStock, count(sku_id)
from zepto 
group by outOfStock;

-- product names present multiple times or checking duplicates
select name, count(sku_id) as "Number of SKUs"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

--- data cleaning

-- product with price 0
select * from zepto
where mrp =0 or discountedSellingPrice = 0;

delete from zepto 
where mrp =0;

--convert paise to ruppees
update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto

--Q1. find the top 10 best-value products based on the discount percentage,
select distinct name, mrp, discountPercent
from zepto
order by discountPercent DESC
limit 10;


--Q2. what are the products with High MRP but out of stock

select distinct name,mrp
from zepto
where outOfStock = TRUE and mrp >300
order by mrp desc;

--Q3. Calculate Estimated Revenue for each category
select category,
sum(discountedSellingPrice * availableQuantity) AS total_revenue
from zepto
group by category
order by total_revenue;


--Q4. find all products where MRP is greater than 500 and discount is less than 10%
select distinct name, mrp, discountPercent
from zepto
where mrp > 500 and discountPercent <10
order by mrp DESC, discountPercent desc;

--Q5. identify the top 5 categories offering the highest average discount percentage
select category,
round(avg(discountPercent),2) as avg_discount
from zepto
group by category
order by avg_discount DESC
limit 5;

--Q6. find the price per gram for products above 100g and sort the best value.
select distinct name, weightInGms, discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms >= 100
order by price_per_gram;

--Q7. group the products into categories like low, medium,bulk
select distinct name,weightInGms,
case when weightInGms < 1000 then 'low'
when weightInGms < 5000 then 'medium'
else 'bulk'
end as weight_category
from zepto;

--Q8. what is the total inventory weight per category
select category, 
sum(weightInGms * availableQuantity) as total_weight
from zepto
group by category
order by total_weight;
