							-- Request 4 -- 
WITH 
    CTE AS ( 
        SELECT tb.segment, COUNT(DISTINCT tb.product) AS Product_Count_2020  
        FROM dim_product tb
        JOIN fact_sales_monthly td ON td.product_code = tb.product_code
        WHERE td.fiscal_year = '2020'
        GROUP BY tb.segment
    ),
    
    CTE2 AS ( 
        SELECT tb.segment, COUNT(DISTINCT tb.product) AS Product_Count_2021 
        FROM dim_product tb
        JOIN fact_sales_monthly td ON td.product_code = tb.product_code
        WHERE td.fiscal_year = '2021'
        GROUP BY tb.segment
    )

SELECT 
    T1.Segment,
    T2.Product_Count_2021,
    T1.Product_Count_2020,  
    (T2.Product_Count_2021 - T1.Product_Count_2020) AS Change_in_Product_Count,
    Round(((T2.Product_Count_2021 - T1.Product_Count_2020) * 100.0 / NULLIF(T1.Product_Count_2020, 0)),2) AS Change_Percentage
FROM CTE T1
JOIN CTE2 T2 ON T1.Segment = T2.Segment;