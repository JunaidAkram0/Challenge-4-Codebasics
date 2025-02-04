					-- Request 6 -- 
select 
		distinct td.customer_code, 
        tb.Customer, 
        Round(avg(td.pre_invoice_discount_pct * 100.0),2) as 'Average_Discount_Percentage'
from fact_pre_invoice_deductions td
Join 
	dim_customer tb on tb.customer_code = td.customer_code
where 
		td.fiscal_year = '2021' and tb.market = 'india'
Group by td.customer_code , tb.customer
order by Average_Discount_Percentage desc
Limit 5;