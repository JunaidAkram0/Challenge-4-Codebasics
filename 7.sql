					-- Request 7 -- 

select * from fact_sales_monthly;
Select * from fact_gross_price;
select * from dim_customer;

Select 
		month(ta.date) as 'Month', 
		year(ta.date) as 'Year', 
        Round(sum(ta.sold_quantity*tb.gross_price),2) as 'Gross Amount' 
from fact_sales_monthly ta

Join 
	fact_gross_price tb on tb.product_code = ta.product_code  
and tb.fiscal_year = ta.fiscal_year

join 
		dim_customer tc on tc.customer_code = ta.customer_code
where tc.customer = 'Atliq Exclusive'

Group by 
			month(ta.date), year(ta.date)
order by 
			year(ta.date), month(ta.date);