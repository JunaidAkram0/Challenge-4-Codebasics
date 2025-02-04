			-- ad hoc request 3 --

Select Segment, Count(product) as 'Product_Count' from dim_product
Group by Segment
order by Count(product) desc;