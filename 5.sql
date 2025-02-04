-- Request 5 -- 


(
Select Distinct tb.product_code,tb.product, td.manufacturing_cost from dim_product tb
Join fact_manufacturing_cost td on td.product_code = tb.product_code
Group by tb.product, td.manufacturing_cost, tb.product_code
order by td.manufacturing_cost desc
Limit 1
)
Union  
(
Select Distinct tb.product_code,tb.product, td.manufacturing_cost from dim_product tb
Join fact_manufacturing_cost td on td.product_code = tb.product_code
Group by tb.product, td.manufacturing_cost, tb.product_code
order by td.manufacturing_cost asc
Limit 1
);

-- Request 5 -- (Alternatie Query)


WITH MinMax AS (
    SELECT 
        tb.product_code, 
        tb.product, 
        td.manufacturing_cost,
        MIN(td.manufacturing_cost) OVER () AS min_cost,
        MAX(td.manufacturing_cost) OVER () AS max_cost
    FROM dim_product tb
    JOIN fact_manufacturing_cost td ON td.product_code = tb.product_code
)
SELECT product_code, product, manufacturing_cost 
FROM MinMax 
WHERE manufacturing_cost = min_cost OR manufacturing_cost = max_cost;