					-- Request 9 -- 
select * from dim_customer;
select * from fact_gross_price;
select * from fact_sales_monthly;

With 
	CTE1 as(
Select 		ta.channel ,
			Round(SUM(tc.sold_quantity * tb.gross_price)/ 1000000 , 2) as Gross_sales_mln
			from dim_customer ta
Join 
			fact_sales_monthly tc on tc.customer_code = ta.customer_code
Join 
			fact_gross_price tb on tb.product_code = tc.product_code and tc.fiscal_year = tb.fiscal_year
Where 
			tb.fiscal_year = 2021
Group by 
			ta.channel
),

Cte2 as (
Select 
		Round(SUM(tc.sold_quantity * tb.gross_price)/ 1000000 , 2) as Total_Gross_sales_mln
from 
		fact_sales_monthly tc
Join 
		fact_gross_price tb on tb.product_code = tc.product_code 
and 
		tc.fiscal_year = tb.fiscal_year
where 
		tb.fiscal_year = 2021 
)
select 
		t1.channel , 
		t1.Gross_sales_mln , 
        Round((t1.Gross_sales_mln  ) / (t2.Total_Gross_sales_mln) * 100.0 ,2)  as 'Percentage'
from 
		CTE1 t1 , Cte2 t2
order by 
		t1.Gross_sales_mln desc;