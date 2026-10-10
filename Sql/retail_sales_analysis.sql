create database retail_sales_db;

use retail_sales_db;

show tables;

describe retail_sales;

# 1.What is the total sales?
select sum(sales_amount) as total_sales
from retail_sales;

# 2.What is the total profit?
select sum(profit) as total_profit
from retail_sales;

# 3.Which product category has the highest sales?
select product_category,sum(sales_amount) as total_sales
from retail_sales
group by product_category
order by total_sales desc;

# 4. Which region generates the highest revenue?
select region,sum(sales_amount) as total_revenue
from retail_sales
group by region
order by total_revenue desc;

# 5.Which city has the highest sales?
select city,sum(sales_amount) as total_sales
from retail_sales
group by city
order by total_sales desc;

# 6.Who are the top 10 customers by sales?
select customer_name,sum(sales_amount) as total_sales
from retail_sales
group by customer_name
order by total_sales desc
limit 10;

# 7.Which payment method is used the most?
select payment_method,count(*) as total_transaction
from retail_sales
group by payment_method
order by total_transaction desc;

# 8.Which product has the highest number of returns?
select product_name,count(*) as total_returns
from retail_sales
where return_flag = 'True'
group by product_name
order by total_returns desc;

# 9.Does discount affect sales and profit?
select discount_pct,
     avg(sales_amount) as avg_sales,
     avg(profit) as avg_profit
from retail_sales
group by discount_pct
order by discount_pct;

# 10.Which age group spends the most?
select
   case 
    when age between 18 and 25 then '18-25'
    when age between 26 and 35 then '26-35'
    when age between 36 and 45 then '36-45'
	when age between 46 and 55 then '46-55'
    else '56+'
    end as age_group,
    sum(sales_amount) as total_sales
from retail_sales
group by age_group
order by total_sales desc;

# 11.What is the average customer satisfaction by region?
select region,avg(customer_satisfaction) as avg_satisfaction
from retail_sales
group by region
order by avg_satisfaction desc;

