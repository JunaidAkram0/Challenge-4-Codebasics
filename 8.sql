						-- Request 8 -- 
select * from fact_sales_monthly;
select 
		Case 
			When month(date) in (9,10,11) then 'Q1'
            when month(date) in (12,1,2) then 'Q2'
            when month(date) in (3,4,5) then 'Q3'
            else 'Q4'
            end as 'Quarter',
            sum(sold_quantity) as Total_Sold_Quantity
            from fact_sales_monthly
Where fiscal_year = 2020
Group by quarter
order by Total_Sold_Quantity desc;