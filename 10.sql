					-- Request 10 -- 
select * from dim_product;
select * from fact_sales_monthly;

With CTE1 as (
select 
		ta.division , 
		ta.product_code , 
        ta.product , 
        sum(tb.sold_quantity) as Total_Sold_Quantity ,
        dense_rank()over(partition by ta.division order by sum(tb.sold_quantity)desc) as rank_order
        from dim_product ta
	Left Join fact_sales_monthly tb on tb.product_code = ta.product_code
    where tb.fiscal_year = 2021
    Group by ta.division , 
		ta.product_code , 
        ta.product 
        )
        
select * from CTE1 
where rank_order <=3 
order by Total_Sold_Quantity desc;