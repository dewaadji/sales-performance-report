/*
	SALES PERFORMANCE REPORT
*/

-- OVERALL PERFORMANCE
-- Overall Performance by Years
select distinct(left(order_date, 4)) years, sum(sales) sales, count(order_status) number_of_order
from dqlab_sales_store
where order_status = 'Order Finished'
group by years;

-- Overall Performance by Product Sub Category
select left(order_date,4) years, product_sub_category, sum(sales) sales
from dqlab_sales_store
where order_status = 'Order finished'
	and left(order_date,4) >2010
group by years, product_sub_category
order by years, sales desc;

-- PROMOTION EFFECTIVENESS AND EFFICIENCY 
-- Promotion Effectiveness and Efficiency by Years
select year(order_date) years, sum(sales) sales, sum(discount_value) promotion_value, round((sum(discount_value)/sum(sales))*100, 2) burn_rate_percentage
from dqlab_sales_store
where order_status = 'Order Finished'
group by years;

-- Promotion Effectiveness and Efficiency by Sub Category
select year(order_date) years, 
	product_sub_category,
	product_category, 
	sum(sales) sales,
	sum(discount_value) promotion_value,
	round((sum(discount_value)/sum(sales))*100, 2) burn_rate_percentage
from dqlab_sales_store
where order_status = 'Order Finished'
and year(order_date) = '2012'
group by years, product_sub_category, product_category
order by sales desc;

-- CUSTOMER ANALYTICS
-- Customer Transactions per Years
select year(order_date) years,
	count(distinct(customer)) number_of_customer
from dqlab_sales_store
where order_status = 'Order Finished'
group by years